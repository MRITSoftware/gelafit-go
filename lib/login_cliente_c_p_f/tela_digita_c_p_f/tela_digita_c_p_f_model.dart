import '/flutter_flow/flutter_flow_util.dart';
import 'tela_digita_c_p_f_widget.dart' show TelaDigitaCPFWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaDigitaCPFModel extends FlutterFlowModel<TelaDigitaCPFWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TxtCPF widget.
  FocusNode? txtCPFFocusNode;
  TextEditingController? txtCPFTextController;
  late MaskTextInputFormatter txtCPFMask;
  String? Function(BuildContext, String?)? txtCPFTextControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    txtCPFFocusNode?.dispose();
    txtCPFTextController?.dispose();
  }
}
