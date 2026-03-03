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

/// Envia uma lista de DtDados em massa para o Supabase.
///
/// - Se estiver offline ou der erro, enfileira cada item individualmente
/// (reaproveita a mesma fila "outbox_relatorios" do fluxo anterior). -
/// Retorna quantos registros foram enviados imediatamente.
Future<int> filaRelatorioVendasLote(List<DtDadosStruct> lista) async {
  final prefs = await SharedPreferences.getInstance();
  final hasNet = await InternetConnectionCheckerPlus().hasConnection;

  // Endpoint e headers (seus)
  const endpoint =
      'https://kihyhoqbrkwbfudttevo.supabase.co/rest/v1/GelaFit-Relatorio-Vendas';

  final headers = <String, String>{
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpaHlob3Ficmt3YmZ1ZHR0ZXZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU1NTUwMjcsImV4cCI6MjAzMTEzMTAyN30.XtBTlSiqhsuUIKmhAMEyxofV-dRst7240n912m4O4Us',
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpaHlob3Ficmt3YmZ1ZHR0ZXZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU1NTUwMjcsImV4cCI6MjAzMTEzMTAyN30.XtBTlSiqhsuUIKmhAMEyxofV-dRst7240n912m4O4Us',
    'Content-Type': 'application/json',
    // Para bulk insert, 'return=minimal' é mais leve. Use 'representation' se quiser resposta com linhas.
    'Prefer': 'return=minimal'
    // Se você tiver uma chave única natural e quiser upsert, pode usar:
    // 'Prefer': 'resolution=merge-duplicates,return=minimal'
    // e adicionar ?on_conflict=SUAS_COLUNAS ao endpoint.
  };

  // Mapeia a lista para o formato da tabela
  List<Map<String, dynamic>> _mapLista(List<DtDadosStruct> lista) {
    return lista.map((d) {
      return {
        'quantidade': d.quantidade,
        'nome_produto': d.nomeProduto,
        'valor': d.valor,
        'imagem': d.imagem,
        'user_id': d.userId,
        'unidade': d.unidade,
        'cliente': d.cliente,
        'CPF_Cliente': d.cPFCliente,
        'forma_pagamento': d.formaPagamento,
        'cupom': d.cupom,
        'franquia': d.franquia,
      };
    }).toList();
  }

  Future<void> _saveItemToOutbox(Map<String, dynamic> itemPayload) async {
    final listStr = prefs.getString('outbox_relatorios');
    final List<dynamic> list = listStr != null ? jsonDecode(listStr) : [];
    final outboxItem = {
      'payload': itemPayload, // um objeto (não lista)
      'endpoint': endpoint,
      'headers': headers,
      'created_at': DateTime.now().millisecondsSinceEpoch,
    };
    list.add(outboxItem);
    await prefs.setString('outbox_relatorios', jsonEncode(list));
  }

  Future<int> _trySendBulk(List<Map<String, dynamic>> body) async {
    final resp = await http
        .post(
          Uri.parse(endpoint /* + '?on_conflict=minha_coluna_unica' */),
          headers: headers,
          body: jsonEncode(body), // <<-- array de objetos
        )
        .timeout(const Duration(seconds: 12));

    if (resp.statusCode >= 200 && resp.statusCode < 300) {
      // enviados imediatamente = tamanho do lote
      return body.length;
    } else {
      debugPrint(
          '⚠️ Falha no envio em massa (${resp.statusCode}): ${resp.body}');
      return 0;
    }
  }

  // Se a lista vier vazia, não faz nada
  if (lista.isEmpty) return 0;

  final payloadLista = _mapLista(lista);

  // Se offline → enfileira todos individualmente e retorna 0
  if (!hasNet) {
    for (final p in payloadLista) {
      await _saveItemToOutbox(p);
    }
    debugPrint('📦 Offline: ${payloadLista.length} itens salvos na fila.');
    return 0;
  }

  // Online: tenta enviar em massa
  try {
    final enviadosAgora = await _trySendBulk(payloadLista);
    if (enviadosAgora == payloadLista.length) {
      // sucesso total
      return enviadosAgora;
    }

    // Se não enviou (ou enviou parcialmente), joga tudo na fila como itens individuais
    for (final p in payloadLista) {
      await _saveItemToOutbox(p);
    }
    debugPrint('⚠️ Lote não enviado: itens enfileirados individualmente.');
    return 0;
  } catch (e) {
    // Em exceção (timeout/erro), enfileira todos individualmente
    for (final p in payloadLista) {
      await _saveItemToOutbox(p);
    }
    debugPrint('⚠️ Exceção no envio em massa ($e): itens enfileirados.');
    return 0;
  }
}
