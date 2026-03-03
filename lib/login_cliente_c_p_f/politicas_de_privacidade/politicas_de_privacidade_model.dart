import '/flutter_flow/flutter_flow_util.dart';
import 'politicas_de_privacidade_widget.dart' show PoliticasDePrivacidadeWidget;
import 'package:flutter/material.dart';

class PoliticasDePrivacidadeModel
    extends FlutterFlowModel<PoliticasDePrivacidadeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ListaPoliticas widget.
  FocusNode? listaPoliticasFocusNode;
  TextEditingController? listaPoliticasTextController;
  String? Function(BuildContext, String?)?
      listaPoliticasTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listaPoliticasFocusNode?.dispose();
    listaPoliticasTextController?.dispose();
  }
}
