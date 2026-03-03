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

/// Atualiza o campo `forma_pagamento` de TODOS os itens armazenados no App
/// State (ex.: FFAppState().dtDadosRelatorio).
Future formaPagamento(String? novaFormaPagamento) async {
  final appState = FFAppState();

  // >>> Se o nome da lista no App State for outro, TROQUE AQUI:
  final List<DtDadosStruct> listaAtual = List<DtDadosStruct>.from(
    appState.dtDadosRelatorio,
  );

  if (listaAtual.isEmpty) {
    debugPrint('formaPagamento: lista do App State está vazia.');
    return;
  }

  final valorForma =
      (novaFormaPagamento ?? '').trim(); // permite null/strings com espaços

  if (valorForma.isEmpty) {
    debugPrint(
        'formaPagamento: valor de forma de pagamento vazio — nada a fazer.');
    return;
  }

  // Cria nova lista com a forma_pagamento atualizada
  final atualizados = <DtDadosStruct>[];
  for (final d in listaAtual) {
    atualizados.add(DtDadosStruct(
      quantidade: d.quantidade,
      nomeProduto: d.nomeProduto,
      valor: d.valor,
      imagem: d.imagem,
      userId: d.userId,
      unidade: d.unidade,
      cliente: d.cliente,
      cPFCliente: d.cPFCliente,
      formaPagamento: valorForma, // <- atualiza aqui
      cupom: d.cupom,
      franquia: d.franquia,
    ));
  }

  // Seta de volta no App State e notifica a UI
  appState.update(() {
    appState.dtDadosRelatorio = atualizados; // <<< troque o nome se for outro
  });

  debugPrint(
    'formaPagamento: setado "$valorForma" em ${atualizados.length} itens.',
  );
}
