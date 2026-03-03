// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtCarrinhoStruct extends BaseStruct {
  DtCarrinhoStruct({
    int? id,
    String? nomeProduto,
    int? quantidade,
  })  : _id = id,
        _nomeProduto = nomeProduto,
        _quantidade = quantidade;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "nome_produto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;

  bool hasNomeProduto() => _nomeProduto != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  static DtCarrinhoStruct fromMap(Map<String, dynamic> data) =>
      DtCarrinhoStruct(
        id: castToType<int>(data['id']),
        nomeProduto: data['nome_produto'] as String?,
        quantidade: castToType<int>(data['quantidade']),
      );

  static DtCarrinhoStruct? maybeFromMap(dynamic data) => data is Map
      ? DtCarrinhoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome_produto': _nomeProduto,
        'quantidade': _quantidade,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'nome_produto': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtCarrinhoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtCarrinhoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        nomeProduto: deserializeParam(
          data['nome_produto'],
          ParamType.String,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtCarrinhoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtCarrinhoStruct &&
        id == other.id &&
        nomeProduto == other.nomeProduto &&
        quantidade == other.quantidade;
  }

  @override
  int get hashCode => const ListEquality().hash([id, nomeProduto, quantidade]);
}

DtCarrinhoStruct createDtCarrinhoStruct({
  int? id,
  String? nomeProduto,
  int? quantidade,
}) =>
    DtCarrinhoStruct(
      id: id,
      nomeProduto: nomeProduto,
      quantidade: quantidade,
    );
