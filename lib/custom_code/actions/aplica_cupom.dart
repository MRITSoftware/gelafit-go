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

/// Aplica desconto percentual (ex.: 50 => 50%) em TODOS os itens
/// guardados no App State (dtDadosRelatorio) e seta `cupom`.
Future aplicaCupom(
  double desconto, // ex.: 50 -> 50%
  String cupomNome, // ex.: "PROMO50"
) async {
  final appState = FFAppState();

  // >>> TROQUE AQUI se sua lista tiver outro nome no App State
  final List<DtDadosStruct> listaAtual = List<DtDadosStruct>.from(
    appState.dtDadosRelatorio,
  );

  if (listaAtual.isEmpty) {
    debugPrint('aplicaCupom: lista do App State está vazia.');
    return;
  }

  final perc = (desconto.isNaN ? 0.0 : desconto).clamp(0, 100) / 100.0;

  final atualizados = <DtDadosStruct>[];
  for (final d in listaAtual) {
    final valorAtual = (d.valor ?? 0).toDouble();
    var novoValor = valorAtual * (1.0 - perc);
    if (novoValor < 0) novoValor = 0;
    novoValor = double.parse(novoValor.toStringAsFixed(2)); // 2 casas

    atualizados.add(DtDadosStruct(
      quantidade: d.quantidade,
      nomeProduto: d.nomeProduto,
      valor: novoValor,
      imagem: d.imagem,
      userId: d.userId,
      unidade: d.unidade,
      cliente: d.cliente,
      cPFCliente: d.cPFCliente,
      formaPagamento: d.formaPagamento,
      franquia: d.franquia,
      cupom: cupomNome,
    ));
  }

  // Substitui a lista inteira no App State e notifica a UI
  appState.update(() {
    appState.dtDadosRelatorio = atualizados; // <<< troque o nome se for outro
  });

  debugPrint(
    'aplicaCupom: aplicado ${desconto}% em ${atualizados.length} itens e setado "$cupomNome".',
  );
}
