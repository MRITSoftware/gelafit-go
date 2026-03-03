import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'page_abrir_geladeira_widget.dart' show PageAbrirGeladeiraWidget;
import 'package:flutter/material.dart';

class PageAbrirGeladeiraModel
    extends FlutterFlowModel<PageAbrirGeladeiraWidget> {
  ///  Local state fields for this page.

  GelaFitSuzanoRow? device;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TimerRegressivo widget.
  final timerRegressivoInitialTimeMs = 10000;
  int timerRegressivoMilliseconds = 10000;
  String timerRegressivoValue = StopWatchTimer.getDisplayTime(
    10000,
    hours: false,
    minute: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerRegressivoController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerRegressivoController.dispose();
  }
}
