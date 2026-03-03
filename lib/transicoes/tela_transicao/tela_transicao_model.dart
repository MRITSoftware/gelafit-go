import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'tela_transicao_widget.dart' show TelaTransicaoWidget;
import 'package:flutter/material.dart';

class TelaTransicaoModel extends FlutterFlowModel<TelaTransicaoWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Query Rows] action in TelaTransicao widget.
  List<PlacasGelaFitRow>? logado;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
