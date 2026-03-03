import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'verifica_pagamento_widget.dart' show VerificaPagamentoWidget;
import 'package:flutter/material.dart';

class VerificaPagamentoModel extends FlutterFlowModel<VerificaPagamentoWidget> {
  ///  Local state fields for this page.

  bool liberaBotao = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (Status Final Maquininha)] action in VerificaPagamento widget.
  ApiCallResponse? statusFinalPagamento;
  InstantTimer? instantTimer;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Stores action output result for [Backend Call - API (Status Final Maquininha)] action in VerificaPagamento widget.
  ApiCallResponse? aprovado;
  // State field(s) for TimerPrincipal widget.
  final timerPrincipalInitialTimeMs = 500;
  int timerPrincipalMilliseconds = 500;
  String timerPrincipalValue = StopWatchTimer.getDisplayTime(
    500,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerPrincipalController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - envioRelatorioVendas] action in TimerPrincipal widget.
  bool? relatorioEnviadoRotaLocalCartao2;
  // Stores action output result for [Custom Action - tuyaLocal] action in TimerPrincipal widget.
  dynamic travaLocalRota1Copy;
  // Stores action output result for [Custom Action - tuyaLocal] action in TimerPrincipal widget.
  dynamic travaLocalRota2Copy;
  // State field(s) for TimerBotao widget.
  final timerBotaoInitialTimeMs = 2000;
  int timerBotaoMilliseconds = 2000;
  String timerBotaoValue = StopWatchTimer.getDisplayTime(
    2000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerBotaoController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Custom Action - envioRelatorioVendas] action in BtnAbrirGeladeira widget.
  bool? relatorioEnviadoRotaLocalCartao;
  // Stores action output result for [Custom Action - tuyaLocal] action in BtnAbrirGeladeira widget.
  dynamic travaLocalRota1;
  // Stores action output result for [Custom Action - tuyaLocal] action in BtnAbrirGeladeira widget.
  dynamic travaLocalRota2;
  // Stores action output result for [Backend Call - API (Gerar Relatorio Prod N Pago)] action in BtnContinuar widget.
  ApiCallResponse? prodnpagosCopy;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    timerPrincipalController.dispose();
    timerBotaoController.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
