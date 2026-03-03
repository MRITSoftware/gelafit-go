import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'suporte_whats_app_widget.dart' show SuporteWhatsAppWidget;
import 'package:flutter/material.dart';

class SuporteWhatsAppModel extends FlutterFlowModel<SuporteWhatsAppWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  final timerInitialTimeMs = 160000;
  int timerMilliseconds = 160000;
  String timerValue = StopWatchTimer.getDisplayTime(
    160000,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
