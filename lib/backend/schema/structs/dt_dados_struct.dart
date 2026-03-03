// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtDadosStruct extends BaseStruct {
  DtDadosStruct({
    int? quantidade,
    String? nomeProduto,
    double? valor,
    String? imagem,
    String? userId,
    String? unidade,
    String? cliente,
    String? cPFCliente,
    String? formaPagamento,
    String? cupom,
    String? franquia,
  })  : _quantidade = quantidade,
        _nomeProduto = nomeProduto,
        _valor = valor,
        _imagem = imagem,
        _userId = userId,
        _unidade = unidade,
        _cliente = cliente,
        _cPFCliente = cPFCliente,
        _formaPagamento = formaPagamento,
        _cupom = cupom,
        _franquia = franquia;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "nome_produto" field.
  String? _nomeProduto;
  String get nomeProduto => _nomeProduto ?? '';
  set nomeProduto(String? val) => _nomeProduto = val;

  bool hasNomeProduto() => _nomeProduto != null;

  // "valor" field.
  double? _valor;
  double get valor => _valor ?? 0.0;
  set valor(double? val) => _valor = val;

  void incrementValor(double amount) => valor = valor + amount;

  bool hasValor() => _valor != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  set imagem(String? val) => _imagem = val;

  bool hasImagem() => _imagem != null;

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "unidade" field.
  String? _unidade;
  String get unidade => _unidade ?? '';
  set unidade(String? val) => _unidade = val;

  bool hasUnidade() => _unidade != null;

  // "cliente" field.
  String? _cliente;
  String get cliente => _cliente ?? '';
  set cliente(String? val) => _cliente = val;

  bool hasCliente() => _cliente != null;

  // "CPF_Cliente" field.
  String? _cPFCliente;
  String get cPFCliente => _cPFCliente ?? '';
  set cPFCliente(String? val) => _cPFCliente = val;

  bool hasCPFCliente() => _cPFCliente != null;

  // "forma_pagamento" field.
  String? _formaPagamento;
  String get formaPagamento => _formaPagamento ?? 'PIX';
  set formaPagamento(String? val) => _formaPagamento = val;

  bool hasFormaPagamento() => _formaPagamento != null;

  // "cupom" field.
  String? _cupom;
  String get cupom => _cupom ?? '';
  set cupom(String? val) => _cupom = val;

  bool hasCupom() => _cupom != null;

  // "franquia" field.
  String? _franquia;
  String get franquia => _franquia ?? '';
  set franquia(String? val) => _franquia = val;

  bool hasFranquia() => _franquia != null;

  static DtDadosStruct fromMap(Map<String, dynamic> data) => DtDadosStruct(
        quantidade: castToType<int>(data['quantidade']),
        nomeProduto: data['nome_produto'] as String?,
        valor: castToType<double>(data['valor']),
        imagem: data['imagem'] as String?,
        userId: data['user_id'] as String?,
        unidade: data['unidade'] as String?,
        cliente: data['cliente'] as String?,
        cPFCliente: data['CPF_Cliente'] as String?,
        formaPagamento: data['forma_pagamento'] as String?,
        cupom: data['cupom'] as String?,
        franquia: data['franquia'] as String?,
      );

  static DtDadosStruct? maybeFromMap(dynamic data) =>
      data is Map ? DtDadosStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'quantidade': _quantidade,
        'nome_produto': _nomeProduto,
        'valor': _valor,
        'imagem': _imagem,
        'user_id': _userId,
        'unidade': _unidade,
        'cliente': _cliente,
        'CPF_Cliente': _cPFCliente,
        'forma_pagamento': _formaPagamento,
        'cupom': _cupom,
        'franquia': _franquia,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'nome_produto': serializeParam(
          _nomeProduto,
          ParamType.String,
        ),
        'valor': serializeParam(
          _valor,
          ParamType.double,
        ),
        'imagem': serializeParam(
          _imagem,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'unidade': serializeParam(
          _unidade,
          ParamType.String,
        ),
        'cliente': serializeParam(
          _cliente,
          ParamType.String,
        ),
        'CPF_Cliente': serializeParam(
          _cPFCliente,
          ParamType.String,
        ),
        'forma_pagamento': serializeParam(
          _formaPagamento,
          ParamType.String,
        ),
        'cupom': serializeParam(
          _cupom,
          ParamType.String,
        ),
        'franquia': serializeParam(
          _franquia,
          ParamType.String,
        ),
      }.withoutNulls;

  static DtDadosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtDadosStruct(
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        nomeProduto: deserializeParam(
          data['nome_produto'],
          ParamType.String,
          false,
        ),
        valor: deserializeParam(
          data['valor'],
          ParamType.double,
          false,
        ),
        imagem: deserializeParam(
          data['imagem'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        unidade: deserializeParam(
          data['unidade'],
          ParamType.String,
          false,
        ),
        cliente: deserializeParam(
          data['cliente'],
          ParamType.String,
          false,
        ),
        cPFCliente: deserializeParam(
          data['CPF_Cliente'],
          ParamType.String,
          false,
        ),
        formaPagamento: deserializeParam(
          data['forma_pagamento'],
          ParamType.String,
          false,
        ),
        cupom: deserializeParam(
          data['cupom'],
          ParamType.String,
          false,
        ),
        franquia: deserializeParam(
          data['franquia'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DtDadosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtDadosStruct &&
        quantidade == other.quantidade &&
        nomeProduto == other.nomeProduto &&
        valor == other.valor &&
        imagem == other.imagem &&
        userId == other.userId &&
        unidade == other.unidade &&
        cliente == other.cliente &&
        cPFCliente == other.cPFCliente &&
        formaPagamento == other.formaPagamento &&
        cupom == other.cupom &&
        franquia == other.franquia;
  }

  @override
  int get hashCode => const ListEquality().hash([
        quantidade,
        nomeProduto,
        valor,
        imagem,
        userId,
        unidade,
        cliente,
        cPFCliente,
        formaPagamento,
        cupom,
        franquia
      ]);
}

DtDadosStruct createDtDadosStruct({
  int? quantidade,
  String? nomeProduto,
  double? valor,
  String? imagem,
  String? userId,
  String? unidade,
  String? cliente,
  String? cPFCliente,
  String? formaPagamento,
  String? cupom,
  String? franquia,
}) =>
    DtDadosStruct(
      quantidade: quantidade,
      nomeProduto: nomeProduto,
      valor: valor,
      imagem: imagem,
      userId: userId,
      unidade: unidade,
      cliente: cliente,
      cPFCliente: cPFCliente,
      formaPagamento: formaPagamento,
      cupom: cupom,
      franquia: franquia,
    );
