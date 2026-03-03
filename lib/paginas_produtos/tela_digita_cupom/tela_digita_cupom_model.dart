import '/flutter_flow/flutter_flow_util.dart';
import 'tela_digita_cupom_widget.dart' show TelaDigitaCupomWidget;
import 'package:flutter/material.dart';

class TelaDigitaCupomModel extends FlutterFlowModel<TelaDigitaCupomWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TxtInserirCupom widget.
  FocusNode? txtInserirCupomFocusNode;
  TextEditingController? txtInserirCupomTextController;
  String? Function(BuildContext, String?)?
      txtInserirCupomTextControllerValidator;
  String? _txtInserirCupomTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Insira o cupom';
    }

    return null;
  }

  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    txtInserirCupomTextControllerValidator =
        _txtInserirCupomTextControllerValidator;
  }

  @override
  void dispose() {
    txtInserirCupomFocusNode?.dispose();
    txtInserirCupomTextController?.dispose();
  }
}
