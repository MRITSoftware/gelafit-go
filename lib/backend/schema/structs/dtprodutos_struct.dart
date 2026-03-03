// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DtprodutosStruct extends BaseStruct {
  DtprodutosStruct({
    int? id,
    String? nomeProduto,
    double? preco,
    String? descricao,
    String? categoria,
    String? imagem,
    int? quantidadeEscolhida,
    int? quantidade,
    int? quantidadeAntiga,
    double? total,
    String? deviceId,
    int? quantidadeNova,
  })  : _id = id,
        _nomeProduto = nomeProduto,
        _preco = preco,
        _descricao = descricao,
        _categoria = categoria,
        _imagem = imagem,
        _quantidadeEscolhida = quantidadeEscolhida,
        _quantidade = quantidade,
        _quantidadeAntiga = quantidadeAntiga,
        _total = total,
        _deviceId = deviceId,
        _quantidadeNova = quantidadeNova;

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

  // "preco" field.
  double? _preco;
  double get preco => _preco ?? 0.0;
  set preco(double? val) => _preco = val;

  void incrementPreco(double amount) => preco = preco + amount;

  bool hasPreco() => _preco != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  set descricao(String? val) => _descricao = val;

  bool hasDescricao() => _descricao != null;

  // "categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  set categoria(String? val) => _categoria = val;

  bool hasCategoria() => _categoria != null;

  // "imagem" field.
  String? _imagem;
  String get imagem => _imagem ?? '';
  set imagem(String? val) => _imagem = val;

  bool hasImagem() => _imagem != null;

  // "quantidadeEscolhida" field.
  int? _quantidadeEscolhida;
  int get quantidadeEscolhida => _quantidadeEscolhida ?? 1;
  set quantidadeEscolhida(int? val) => _quantidadeEscolhida = val;

  void incrementQuantidadeEscolhida(int amount) =>
      quantidadeEscolhida = quantidadeEscolhida + amount;

  bool hasQuantidadeEscolhida() => _quantidadeEscolhida != null;

  // "quantidade" field.
  int? _quantidade;
  int get quantidade => _quantidade ?? 0;
  set quantidade(int? val) => _quantidade = val;

  void incrementQuantidade(int amount) => quantidade = quantidade + amount;

  bool hasQuantidade() => _quantidade != null;

  // "quantidadeAntiga" field.
  int? _quantidadeAntiga;
  int get quantidadeAntiga => _quantidadeAntiga ?? 0;
  set quantidadeAntiga(int? val) => _quantidadeAntiga = val;

  void incrementQuantidadeAntiga(int amount) =>
      quantidadeAntiga = quantidadeAntiga + amount;

  bool hasQuantidadeAntiga() => _quantidadeAntiga != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "device_id" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "quantidadeNova" field.
  int? _quantidadeNova;
  int get quantidadeNova => _quantidadeNova ?? 0;
  set quantidadeNova(int? val) => _quantidadeNova = val;

  void incrementQuantidadeNova(int amount) =>
      quantidadeNova = quantidadeNova + amount;

  bool hasQuantidadeNova() => _quantidadeNova != null;

  static DtprodutosStruct fromMap(Map<String, dynamic> data) =>
      DtprodutosStruct(
        id: castToType<int>(data['id']),
        nomeProduto: data['nome_produto'] as String?,
        preco: castToType<double>(data['preco']),
        descricao: data['descricao'] as String?,
        categoria: data['categoria'] as String?,
        imagem: data['imagem'] as String?,
        quantidadeEscolhida: castToType<int>(data['quantidadeEscolhida']),
        quantidade: castToType<int>(data['quantidade']),
        quantidadeAntiga: castToType<int>(data['quantidadeAntiga']),
        total: castToType<double>(data['total']),
        deviceId: data['device_id'] as String?,
        quantidadeNova: castToType<int>(data['quantidadeNova']),
      );

  static DtprodutosStruct? maybeFromMap(dynamic data) => data is Map
      ? DtprodutosStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'nome_produto': _nomeProduto,
        'preco': _preco,
        'descricao': _descricao,
        'categoria': _categoria,
        'imagem': _imagem,
        'quantidadeEscolhida': _quantidadeEscolhida,
        'quantidade': _quantidade,
        'quantidadeAntiga': _quantidadeAntiga,
        'total': _total,
        'device_id': _deviceId,
        'quantidadeNova': _quantidadeNova,
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
        'preco': serializeParam(
          _preco,
          ParamType.double,
        ),
        'descricao': serializeParam(
          _descricao,
          ParamType.String,
        ),
        'categoria': serializeParam(
          _categoria,
          ParamType.String,
        ),
        'imagem': serializeParam(
          _imagem,
          ParamType.String,
        ),
        'quantidadeEscolhida': serializeParam(
          _quantidadeEscolhida,
          ParamType.int,
        ),
        'quantidade': serializeParam(
          _quantidade,
          ParamType.int,
        ),
        'quantidadeAntiga': serializeParam(
          _quantidadeAntiga,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'device_id': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'quantidadeNova': serializeParam(
          _quantidadeNova,
          ParamType.int,
        ),
      }.withoutNulls;

  static DtprodutosStruct fromSerializableMap(Map<String, dynamic> data) =>
      DtprodutosStruct(
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
        preco: deserializeParam(
          data['preco'],
          ParamType.double,
          false,
        ),
        descricao: deserializeParam(
          data['descricao'],
          ParamType.String,
          false,
        ),
        categoria: deserializeParam(
          data['categoria'],
          ParamType.String,
          false,
        ),
        imagem: deserializeParam(
          data['imagem'],
          ParamType.String,
          false,
        ),
        quantidadeEscolhida: deserializeParam(
          data['quantidadeEscolhida'],
          ParamType.int,
          false,
        ),
        quantidade: deserializeParam(
          data['quantidade'],
          ParamType.int,
          false,
        ),
        quantidadeAntiga: deserializeParam(
          data['quantidadeAntiga'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        deviceId: deserializeParam(
          data['device_id'],
          ParamType.String,
          false,
        ),
        quantidadeNova: deserializeParam(
          data['quantidadeNova'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'DtprodutosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DtprodutosStruct &&
        id == other.id &&
        nomeProduto == other.nomeProduto &&
        preco == other.preco &&
        descricao == other.descricao &&
        categoria == other.categoria &&
        imagem == other.imagem &&
        quantidadeEscolhida == other.quantidadeEscolhida &&
        quantidade == other.quantidade &&
        quantidadeAntiga == other.quantidadeAntiga &&
        total == other.total &&
        deviceId == other.deviceId &&
        quantidadeNova == other.quantidadeNova;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        nomeProduto,
        preco,
        descricao,
        categoria,
        imagem,
        quantidadeEscolhida,
        quantidade,
        quantidadeAntiga,
        total,
        deviceId,
        quantidadeNova
      ]);
}

DtprodutosStruct createDtprodutosStruct({
  int? id,
  String? nomeProduto,
  double? preco,
  String? descricao,
  String? categoria,
  String? imagem,
  int? quantidadeEscolhida,
  int? quantidade,
  int? quantidadeAntiga,
  double? total,
  String? deviceId,
  int? quantidadeNova,
}) =>
    DtprodutosStruct(
      id: id,
      nomeProduto: nomeProduto,
      preco: preco,
      descricao: descricao,
      categoria: categoria,
      imagem: imagem,
      quantidadeEscolhida: quantidadeEscolhida,
      quantidade: quantidade,
      quantidadeAntiga: quantidadeAntiga,
      total: total,
      deviceId: deviceId,
      quantidadeNova: quantidadeNova,
    );
