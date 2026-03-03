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

import 'package:http/http.dart' as http;
import 'dart:convert';

/// tuyaLocal
/// Envia comando para o servidor local rodando no mesmo aparelho.
Future<dynamic> tuyaLocal(
  String deviceId,
  String action,
  String localKey,
  String lanIp,
  String? deviceName,
  String? version,
) async {
  final normalizedAction = action.toLowerCase().trim();
  if (normalizedAction != 'on' && normalizedAction != 'off') {
    throw Exception("Ação inválida: use 'on' ou 'off'. Recebido: $action");
  }

  final uri = Uri.parse('http://127.0.0.1:8000/tuya/command');

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

  try {
    final response = await http
        .post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(payload),
        )
        .timeout(const Duration(seconds: 5));

    // SUCESSO (2xx)
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return {
        'ok': 200, // ← SEMPRE 200
        'body': response.body,
      };
    }

    // ERRO HTTP
    return {
      'ok': null, // ← ERRO → NULO
      'statusCode': response.statusCode,
      'body': response.body,
    };
  } catch (e) {
    // Timeout, erro de rede etc.
    return {
      'ok': null, // ← ERRO → NULO
      'error': e.toString(),
    };
  }
}
