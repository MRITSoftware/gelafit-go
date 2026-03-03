import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'tela_cadastro_widget.dart' show TelaCadastroWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TelaCadastroModel extends FlutterFlowModel<TelaCadastroWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  InstantTimer? instantTimer;
  Completer<List<GelaFitClientesRow>>? requestCompleter;
  // Stores action output result for [Custom Action - validarCPF] action in TelaCadastro widget.
  bool? resultadoCPF2;
  // State field(s) for CPF widget.
  FocusNode? cpfFocusNode;
  TextEditingController? cpfTextController;
  late MaskTextInputFormatter cpfMask;
  String? Function(BuildContext, String?)? cpfTextControllerValidator;
  String? _cpfTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 14) {
      return 'Insira um CPF válido';
    }
    if (val.length > 14) {
      return 'Maximum 14 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  List<String> simpleSearchResults = [];
  // Stores action output result for [Custom Action - validarCPF] action in CPF widget.
  bool? resultadoCPF3;
  // Stores action output result for [Custom Action - contarCaracteres] action in CPF widget.
  int? contaCPF;
  // State field(s) for NomeCompleto widget.
  FocusNode? nomeCompletoFocusNode;
  TextEditingController? nomeCompletoTextController;
  String? Function(BuildContext, String?)? nomeCompletoTextControllerValidator;
  String? _nomeCompletoTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    return null;
  }

  // State field(s) for NumTelefone widget.
  FocusNode? numTelefoneFocusNode;
  TextEditingController? numTelefoneTextController;
  late MaskTextInputFormatter numTelefoneMask;
  String? Function(BuildContext, String?)? numTelefoneTextControllerValidator;
  String? _numTelefoneTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo Obrigatório';
    }

    if (val.length < 16) {
      return 'Insira um número de celular válido';
    }

    return null;
  }

  // State field(s) for CheckBoxConcordoTermos widget.
  bool? checkBoxConcordoTermosValue;
  // Stores action output result for [Custom Action - validarCPF] action in BtnCadastrar widget.
  bool? resultadoCPF;

  @override
  void initState(BuildContext context) {
    cpfTextControllerValidator = _cpfTextControllerValidator;
    nomeCompletoTextControllerValidator = _nomeCompletoTextControllerValidator;
    numTelefoneTextControllerValidator = _numTelefoneTextControllerValidator;
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    cpfFocusNode?.dispose();
    cpfTextController?.dispose();

    nomeCompletoFocusNode?.dispose();
    nomeCompletoTextController?.dispose();

    numTelefoneFocusNode?.dispose();
    numTelefoneTextController?.dispose();
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
