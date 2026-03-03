import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tela_escolhe_cupom_widget.dart' show TelaEscolheCupomWidget;
import 'package:flutter/material.dart';

class TelaEscolheCupomModel extends FlutterFlowModel<TelaEscolheCupomWidget> {
  ///  Local state fields for this component.

  String cupomSelecionado = '';

  String? valorPorcentagem;

  String? valorComDesconto;

  List<String> cuponsUsados = [];
  void addToCuponsUsados(String item) => cuponsUsados.add(item);
  void removeFromCuponsUsados(String item) => cuponsUsados.remove(item);
  void removeAtIndexFromCuponsUsados(int index) => cuponsUsados.removeAt(index);
  void insertAtIndexInCuponsUsados(int index, String item) =>
      cuponsUsados.insert(index, item);
  void updateCuponsUsadosAtIndex(int index, Function(String) updateFn) =>
      cuponsUsados[index] = updateFn(cuponsUsados[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<GelaFitUsuariosCuponsRow>? cupomEscolhido;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
