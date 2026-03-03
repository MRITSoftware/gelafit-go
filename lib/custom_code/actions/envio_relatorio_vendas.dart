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

import 'package:supabase_flutter/supabase_flutter.dart';

/// Envia todas as linhas de DtDadosStruct em lote para a tabela
/// "GelaFit-Relatorio-Vendas" no Supabase.
///
/// Retorna `true` se o envio for bem-sucedido, `false` se falhar.
Future<bool> envioRelatorioVendas(
  List<DtDadosStruct> itens,
  bool limparAposEnvio,
) async {
  if (itens.isEmpty) {
    debugPrint('⚠️ Nenhum item para enviar.');
    return false;
  }

  final supa = Supabase.instance.client;
  const table = 'GelaFit-Relatorio-Vendas';

  // Mapeia cada struct para o formato da tabela no Supabase
  final rows = itens
      .map((d) => {
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
          })
      .toList();

  try {
    await supa.from(table).insert(rows);

    if (limparAposEnvio) {
      try {
        itens.clear();
      } catch (_) {}
    }

    debugPrint(
        '✅ ${rows.length} registros enviados. Limpeza: $limparAposEnvio');
    return true;
  } on PostgrestException catch (e) {
    debugPrint('❌ Erro Supabase: ${e.message}');
    return false;
  } catch (e) {
    debugPrint('❌ Erro inesperado no envio: $e');
    return false;
  }
}
