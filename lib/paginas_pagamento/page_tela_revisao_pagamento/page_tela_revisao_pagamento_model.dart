import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'dart:async';
import 'page_tela_revisao_pagamento_widget.dart'
    show PageTelaRevisaoPagamentoWidget;
import 'package:flutter/material.dart';

class PageTelaRevisaoPagamentoModel
    extends FlutterFlowModel<PageTelaRevisaoPagamentoWidget> {
  ///  Local state fields for this page.

  List<DtDadosStruct> varDados = [];
  void addToVarDados(DtDadosStruct item) => varDados.add(item);
  void removeFromVarDados(DtDadosStruct item) => varDados.remove(item);
  void removeAtIndexFromVarDados(int index) => varDados.removeAt(index);
  void insertAtIndexInVarDados(int index, DtDadosStruct item) =>
      varDados.insert(index, item);
  void updateVarDadosAtIndex(int index, Function(DtDadosStruct) updateFn) =>
      varDados[index] = updateFn(varDados[index]);

  ///  State fields for stateful widgets in this page.

  Completer<List<GelaFitSuzanoRow>>? requestCompleter;
  // Stores action output result for [Backend Call - API (Pagamento PIX)] action in BtnPagarPIX widget.
  ApiCallResponse? gerarPix;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
