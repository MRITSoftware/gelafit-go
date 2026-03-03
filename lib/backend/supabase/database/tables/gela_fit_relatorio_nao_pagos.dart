import '../database.dart';

class GelaFitRelatorioNaoPagosTable
    extends SupabaseTable<GelaFitRelatorioNaoPagosRow> {
  @override
  String get tableName => 'GelaFit-Relatorio-NaoPagos';

  @override
  GelaFitRelatorioNaoPagosRow createRow(Map<String, dynamic> data) =>
      GelaFitRelatorioNaoPagosRow(data);
}

class GelaFitRelatorioNaoPagosRow extends SupabaseDataRow {
  GelaFitRelatorioNaoPagosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GelaFitRelatorioNaoPagosTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  int? get quantidade => getField<int>('quantidade');
  set quantidade(int? value) => setField<int>('quantidade', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get cPFCliente => getField<String>('CPF_Cliente');
  set cPFCliente(String? value) => setField<String>('CPF_Cliente', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  String? get formaPagamento => getField<String>('forma_pagamento');
  set formaPagamento(String? value) =>
      setField<String>('forma_pagamento', value);

  String? get cupom => getField<String>('cupom');
  set cupom(String? value) => setField<String>('cupom', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);
}
