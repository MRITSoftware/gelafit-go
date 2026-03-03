import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'page_pagamento_p_i_x_widget.dart' show PagePagamentoPIXWidget;
import 'package:flutter/material.dart';

class PagePagamentoPIXModel extends FlutterFlowModel<PagePagamentoPIXWidget> {
  ///  Local state fields for this page.

  String qrcode = '1';

  String? status = '1';

  int idpedido = 1;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for TxtFieldOCULTOTOTALGERAL widget.
  FocusNode? txtFieldOCULTOTOTALGERALFocusNode;
  TextEditingController? txtFieldOCULTOTOTALGERALTextController;
  String? Function(BuildContext, String?)?
      txtFieldOCULTOTOTALGERALTextControllerValidator;
  // State field(s) for ContagemRegressiva widget.
  final contagemRegressivaInitialTimeMs = 180000;
  int contagemRegressivaMilliseconds = 180000;
  String contagemRegressivaValue = StopWatchTimer.getDisplayTime(
    180000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController contagemRegressivaController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  // Stores action output result for [Backend Call - API (Status Pix)] action in ContagemRegressiva widget.
  ApiCallResponse? apiResultfmh;
  // Stores action output result for [Custom Action - envioRelatorioVendas] action in BtnAbrirGeladeira widget.
  bool? relatorioEnviadoRotaLocalPIX;
  // Stores action output result for [Custom Action - tuyaLocal] action in BtnAbrirGeladeira widget.
  dynamic travaLocalRota1;
  // Stores action output result for [Custom Action - tuyaLocal] action in BtnAbrirGeladeira widget.
  dynamic travaLocalRota2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    txtFieldOCULTOTOTALGERALFocusNode?.dispose();
    txtFieldOCULTOTOTALGERALTextController?.dispose();

    contagemRegressivaController.dispose();
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
