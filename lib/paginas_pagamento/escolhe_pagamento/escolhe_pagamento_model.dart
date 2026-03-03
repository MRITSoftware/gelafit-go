import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'escolhe_pagamento_widget.dart' show EscolhePagamentoWidget;
import 'package:flutter/material.dart';

class EscolhePagamentoModel extends FlutterFlowModel<EscolhePagamentoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (Pag Maquininha Debito)] action in BtnDebito widget.
  ApiCallResponse? pagamentoDebito;
  // Stores action output result for [Backend Call - API (Pag Maquininha Credito)] action in BtnCredito widget.
  ApiCallResponse? pagamentoCredito;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
