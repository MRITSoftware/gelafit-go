import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'page_carrinho_compras_widget.dart' show PageCarrinhoComprasWidget;
import 'package:flutter/material.dart';

class PageCarrinhoComprasModel
    extends FlutterFlowModel<PageCarrinhoComprasWidget> {
  ///  Local state fields for this page.

  List<DtprodutosStruct> varDados = [];
  void addToVarDados(DtprodutosStruct item) => varDados.add(item);
  void removeFromVarDados(DtprodutosStruct item) => varDados.remove(item);
  void removeAtIndexFromVarDados(int index) => varDados.removeAt(index);
  void insertAtIndexInVarDados(int index, DtprodutosStruct item) =>
      varDados.insert(index, item);
  void updateVarDadosAtIndex(int index, Function(DtprodutosStruct) updateFn) =>
      varDados[index] = updateFn(varDados[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
