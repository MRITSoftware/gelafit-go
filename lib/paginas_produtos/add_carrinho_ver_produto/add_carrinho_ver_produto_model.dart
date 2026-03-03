import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_carrinho_ver_produto_widget.dart' show AddCarrinhoVerProdutoWidget;
import 'package:flutter/material.dart';

class AddCarrinhoVerProdutoModel
    extends FlutterFlowModel<AddCarrinhoVerProdutoWidget> {
  ///  Local state fields for this component.

  double? totalitem2;

  DtDadosStruct? varDados2;
  void updateVarDados2Struct(Function(DtDadosStruct) updateFn) {
    updateFn(varDados2 ??= DtDadosStruct());
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
