import '/flutter_flow/flutter_flow_util.dart';
import 'deslogar_widget.dart' show DeslogarWidget;
import 'package:flutter/material.dart';

class DeslogarModel extends FlutterFlowModel<DeslogarWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TxtSenha widget.
  FocusNode? txtSenhaFocusNode;
  TextEditingController? txtSenhaTextController;
  late bool txtSenhaVisibility;
  String? Function(BuildContext, String?)? txtSenhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    txtSenhaVisibility = false;
  }

  @override
  void dispose() {
    txtSenhaFocusNode?.dispose();
    txtSenhaTextController?.dispose();
  }
}
