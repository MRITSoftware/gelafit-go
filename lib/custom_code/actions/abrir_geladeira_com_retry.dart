// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>> _enqueueOpenFailure({
  required String transactionId,
  required String deviceId,
  required String action,
  required String localKey,
  required String lanIp,
  String? deviceName,
  String? version,
  String? error,
}) async {
  final prefs = await SharedPreferences.getInstance();
  final current = prefs.getString('outbox_abertura_falha');
  final List<dynamic> queue = current != null ? jsonDecode(current) : [];

  queue.add({
    'transaction_id': transactionId,
    'created_at': DateTime.now().toIso8601String(),
    'device_id': deviceId,
    'action': action,
    'local_key': localKey,
    'lan_ip': lanIp,
    'device_name': deviceName,
    'version': version,
    'error': error,
  });

  await prefs.setString('outbox_abertura_falha', jsonEncode(queue));
  return {'queued': true, 'queue_size': queue.length};
}

/// Tenta abrir a geladeira localmente com retentativas.
/// - Independe de internet (usa 127.0.0.1)
/// - Em falha total, salva incidente em fila local.
Future<dynamic> abrirGeladeiraComRetry(
  String deviceId,
  String action,
  String localKey,
  String lanIp,
  String? deviceName,
  String? version,
) async {
  final normalizedAction = action.toLowerCase().trim();
  if (normalizedAction != 'on' && normalizedAction != 'off') {
    throw Exception("Acao invalida: use 'on' ou 'off'. Recebido: $action");
  }

  final uri = Uri.parse('http://127.0.0.1:8000/tuya/command');
  final transactionId = DateTime.now().millisecondsSinceEpoch.toString();

  final payload = <String, dynamic>{
    'tuya_device_id': deviceId,
    'local_key': localKey,
    'lan_ip': lanIp,
    'action': normalizedAction,
  };
  if (deviceName != null && deviceName.trim().isNotEmpty) {
    payload['device_name'] = deviceName.trim();
  }
  if (version != null && version.trim().isNotEmpty) {
    payload['version'] = version.trim();
  }

  final delays = <Duration>[
    Duration.zero,
    const Duration(milliseconds: 700),
    const Duration(milliseconds: 1500),
  ];

  Map<String, dynamic> lastError = {
    'ok': null,
    'success': false,
    'transaction_id': transactionId,
  };

  for (var i = 0; i < delays.length; i++) {
    if (delays[i] != Duration.zero) {
      await Future.delayed(delays[i]);
    }

    try {
      final response = await http
          .post(
            uri,
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(payload),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {
          'ok': 200,
          'success': true,
          'attempts': i + 1,
          'transaction_id': transactionId,
          'body': response.body,
        };
      }

      lastError = {
        'ok': null,
        'success': false,
        'attempts': i + 1,
        'transaction_id': transactionId,
        'statusCode': response.statusCode,
        'body': response.body,
      };
    } catch (e) {
      lastError = {
        'ok': null,
        'success': false,
        'attempts': i + 1,
        'transaction_id': transactionId,
        'error': e.toString(),
      };
    }
  }

  final queueInfo = await _enqueueOpenFailure(
    transactionId: transactionId,
    deviceId: deviceId,
    action: normalizedAction,
    localKey: localKey,
    lanIp: lanIp,
    deviceName: deviceName,
    version: version,
    error: lastError['error']?.toString() ??
        lastError['body']?.toString() ??
        'unknown_error',
  );

  return {
    ...lastError,
    ...queueInfo,
  };
}

