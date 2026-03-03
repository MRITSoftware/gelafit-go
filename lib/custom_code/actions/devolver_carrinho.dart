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

/// Devolve todos os itens do carrinho ao estoque.
/// Recebe a lista de DtprodutosStruct (itensSacola).
/// Retorna true se conseguiu devolver tudo.
Future<bool> devolverCarrinho(
  List<DtprodutosStruct> itens,
) async {
  if (itens.isEmpty) return true;

  final supabase = Supabase.instance.client;

  try {
    // Agrupar quantidades por produto
    final Map<int, int> somaPorProduto = {};

    for (final item in itens) {
      if (item.id == null) continue;

      final int id = item.id!;
      final int qty = item.quantidadeEscolhida ?? 1;

      somaPorProduto[id] = (somaPorProduto[id] ?? 0) + qty;
    }

    // Para cada produto, devolver ao estoque
    for (final entry in somaPorProduto.entries) {
      final res = await supabase.rpc(
        'increment_stock',
        params: <String, dynamic>{
          'p_id': entry.key,
          'p_qty': entry.value,
        },
      );

      if (res != true) {
        return false;
      }
    }

    return true;
  } catch (e) {
    // debugPrint('devolverCarrinho error: $e');
    return false;
  }
}
