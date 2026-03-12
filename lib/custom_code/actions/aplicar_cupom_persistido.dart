// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart';
import '/flutter_flow/custom_functions.dart';
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> aplicarCupomPersistido(
  String cupomCodigo,
  double descontoPercentual,
  bool excluirCupomUnico,
) async {
  final appState = FFAppState();
  final codigo = cupomCodigo.trim();

  if (codigo.isEmpty) {
    return false;
  }

  await GelaFitUsuariosCuponsTable().insert({
    'CPF': appState.cpf,
    'cupom': codigo,
    'valorCupom': descontoPercentual.round(),
  });

  await GelaFitClientesTable().update(
    data: {
      'cupom': codigo,
    },
    matchingRows: (rows) => rows.eqOrNull(
      'cpf',
      appState.cpf,
    ),
  );

  if (excluirCupomUnico) {
    await CupomdescontoTable().delete(
      matchingRows: (rows) => rows.eqOrNull(
        'cupom',
        codigo,
      ),
    );
  }

  final fator = 1 - (descontoPercentual / 100.0);
  appState.totalGeral =
      double.parse((appState.totalGeral * fator).toStringAsFixed(2));
  appState.cupom = true;
  appState.msgCupom = false;
  appState.cupomInserido = codigo;

  final listaAtual = List<DtDadosStruct>.from(appState.dtDadosRelatorio);
  final atualizados = <DtDadosStruct>[];
  for (final d in listaAtual) {
    final valorAtual = (d.valor ?? 0).toDouble();
    var novoValor = valorAtual * fator;
    if (novoValor < 0) novoValor = 0;
    novoValor = double.parse(novoValor.toStringAsFixed(2));

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
      cupom: codigo,
    ));
  }

  appState.update(() {
    appState.dtDadosRelatorio = atualizados;
  });

  return true;
}
