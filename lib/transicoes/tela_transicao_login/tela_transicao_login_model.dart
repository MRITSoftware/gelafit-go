import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'tela_transicao_login_widget.dart' show TelaTransicaoLoginWidget;
import 'package:flutter/material.dart';

class TelaTransicaoLoginModel
    extends FlutterFlowModel<TelaTransicaoLoginWidget> {
  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Query Rows] action in TelaTransicaoLogin widget.
  List<PlacasGelaFitRow>? logado;
  // Stores action output result for [Backend Call - Query Rows] action in TelaTransicaoLogin widget.
  List<TuyaDevicesRow>? attLocal;
  // Stores action output result for [Backend Call - Query Rows] action in CtnPrincipal widget.
  List<PlacasGelaFitRow>? logadoTentativa2;
  // Stores action output result for [Backend Call - Query Rows] action in CtnPrincipal widget.
  List<TuyaDevicesRow>? attLocal1;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
