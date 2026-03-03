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
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

/// Reenvia itens pendentes da fila local ("outbox_relatorios").
///
/// Retorna a quantidade de itens reenviados com sucesso.
Future<int> reenviarFilaRelatorios() async {
  final prefs = await SharedPreferences.getInstance();

  // se estiver offline, nem tenta
  final hasNet = await InternetConnectionCheckerPlus().hasConnection;
  if (!hasNet) {
    debugPrint('🌐 Sem internet — não há reenvio agora.');
    return 0;
  }

  // carrega a fila
  final listStr = prefs.getString('outbox_relatorios');
  final List<dynamic> queue = listStr != null ? jsonDecode(listStr) : [];
  if (queue.isEmpty) {
    return 0;
  }

  int sent = 0;
  final remaining = <dynamic>[];

  // processa sequencialmente; para no primeiro erro
  for (final raw in queue) {
    try {
      final item = Map<String, dynamic>.from(raw as Map);

      final String endpoint = item['endpoint'] as String;
      final Map<String, String> headers =
          Map<String, String>.from(item['headers'] as Map);
      final Map<String, dynamic> payload =
          Map<String, dynamic>.from(item['payload'] as Map);

      final resp = await http
          .post(
            Uri.parse(endpoint),
            headers: headers,
            body: jsonEncode(payload),
          )
          .timeout(const Duration(seconds: 8));

      if (resp.statusCode >= 200 && resp.statusCode < 300) {
        sent += 1; // ok — não volta para a fila
        continue;
      } else {
        // falhou — mantém esse e os próximos para a próxima rodada e para aqui
        remaining.add(raw);
        debugPrint('⚠️ Reenvio falhou (${resp.statusCode}): ${resp.body}');
        break;
      }
    } catch (e) {
      // erro de rede/timeout — mantém e para
      remaining.add(raw);
      debugPrint('⚠️ Exceção no reenvio: $e');
      break;
    }
  }

  // se ainda restaram itens não processados (após o primeiro erro),
  // adiciona o restante original da fila
  final processed = sent + remaining.length;
  if (processed < queue.length) {
    remaining.addAll(queue.sublist(processed));
  }

  // persiste a fila atualizada
  await prefs.setString('outbox_relatorios', jsonEncode(remaining));
  debugPrint(
      '🔁 Reenvio concluído — enviados: $sent, pendentes: ${remaining.length}');

  return sent;
}
