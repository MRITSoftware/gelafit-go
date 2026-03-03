import '../database.dart';

class GelaFitSuzanoTable extends SupabaseTable<GelaFitSuzanoRow> {
  @override
  String get tableName => 'GelaFit-Suzano';

  @override
  GelaFitSuzanoRow createRow(Map<String, dynamic> data) =>
      GelaFitSuzanoRow(data);
}

class GelaFitSuzanoRow extends SupabaseDataRow {
  GelaFitSuzanoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GelaFitSuzanoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get preco => getField<double>('preco');
  set preco(double? value) => setField<double>('preco', value);

  bool? get destaque => getField<bool>('destaque');
  set destaque(bool? value) => setField<bool>('destaque', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  int? get quantidade => getField<int>('quantidade');
  set quantidade(int? value) => setField<int>('quantidade', value);

  String? get deviceId => getField<String>('device_id');
  set deviceId(String? value) => setField<String>('device_id', value);

  int? get quantidadeAntiga => getField<int>('quantidadeAntiga');
  set quantidadeAntiga(int? value) => setField<int>('quantidadeAntiga', value);

  String? get userRef => getField<String>('user_ref');
  set userRef(String? value) => setField<String>('user_ref', value);

  String? get emailUser => getField<String>('email_user');
  set emailUser(String? value) => setField<String>('email_user', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  bool? get clubben => getField<bool>('clubben');
  set clubben(bool? value) => setField<bool>('clubben', value);

  DateTime? get dataValidade => getField<DateTime>('dataValidade');
  set dataValidade(DateTime? value) =>
      setField<DateTime>('dataValidade', value);

  String? get qtdAbastecida => getField<String>('qtdAbastecida');
  set qtdAbastecida(String? value) => setField<String>('qtdAbastecida', value);

  int? get ordem => getField<int>('ordem');
  set ordem(int? value) => setField<int>('ordem', value);
}
