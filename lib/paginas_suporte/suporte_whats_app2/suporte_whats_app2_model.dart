import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'suporte_whats_app2_widget.dart' show SuporteWhatsApp2Widget;
import 'package:flutter/material.dart';

class SuporteWhatsApp2Model extends FlutterFlowModel<SuporteWhatsApp2Widget> {
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
