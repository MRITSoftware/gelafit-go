import '../database.dart';

class GelaFitClientesTable extends SupabaseTable<GelaFitClientesRow> {
  @override
  String get tableName => 'GelaFit-Clientes';

  @override
  GelaFitClientesRow createRow(Map<String, dynamic> data) =>
      GelaFitClientesRow(data);
}

class GelaFitClientesRow extends SupabaseDataRow {
  GelaFitClientesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GelaFitClientesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeCliente => getField<String>('nome_cliente');
  set nomeCliente(String? value) => setField<String>('nome_cliente', value);

  String get cpf => getField<String>('cpf')!;
  set cpf(String value) => setField<String>('cpf', value);

  String? get celular => getField<String>('celular');
  set celular(String? value) => setField<String>('celular', value);

  String? get unidadeGelaFit => getField<String>('unidadeGelaFit');
  set unidadeGelaFit(String? value) =>
      setField<String>('unidadeGelaFit', value);

  String? get cupom => getField<String>('cupom');
  set cupom(String? value) => setField<String>('cupom', value);

  bool? get ativo => getField<bool>('ativo');
  set ativo(bool? value) => setField<bool>('ativo', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);
}
