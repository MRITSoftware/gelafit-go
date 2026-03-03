import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'login_c_p_f_widget.dart' show LoginCPFWidget;
import 'package:flutter/material.dart';

class LoginCPFModel extends FlutterFlowModel<LoginCPFWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  Completer<List<PlacasGelaFitRow>>? requestCompleter;
  // Stores action output result for [Custom Action - checkInternet] action in LoginCPF widget.
  bool? checaNetTelaLogin;
  // Stores action output result for [Custom Action - checkInternet] action in BtnEntrar widget.
  bool? checaNet;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }

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
