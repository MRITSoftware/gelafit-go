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

/// Chama a RPC `increment_stock(p_id, p_qty)` no Supabase.
/// Retorna:
/// - true  -> conseguiu devolver ao estoque
/// - false -> erro de rede ou parâmetros inválidos
Future<bool> devolverEstoque(
  int productId,
  int qty,
) async {
  if (productId <= 0) return false;
  if (qty <= 0) return false;

  final supabase = Supabase.instance.client;

  try {
    final res = await supabase.rpc(
      'increment_stock',
      params: <String, dynamic>{
        'p_id': productId, // bigint no banco, int funciona aqui
        'p_qty': qty,
      },
    );

    return res == true;
  } catch (e) {
    // Se quiser debugar:
    // debugPrint('devolverEstoque error: $e');
    return false;
  }
}
