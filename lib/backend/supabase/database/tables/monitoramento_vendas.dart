import '../database.dart';

class MonitoramentoVendasTable extends SupabaseTable<MonitoramentoVendasRow> {
  @override
  String get tableName => 'monitoramento_vendas';

  @override
  MonitoramentoVendasRow createRow(Map<String, dynamic> data) =>
      MonitoramentoVendasRow(data);
}

class MonitoramentoVendasRow extends SupabaseDataRow {
  MonitoramentoVendasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MonitoramentoVendasTable();

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  int? get quantidade => getField<int>('quantidade');
  set quantidade(int? value) => setField<int>('quantidade', value);

  double? get valor => getField<double>('valor');
  set valor(double? value) => setField<double>('valor', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  String? get cliente => getField<String>('cliente');
  set cliente(String? value) => setField<String>('cliente', value);

  String? get cPFCliente => getField<String>('CPF_Cliente');
  set cPFCliente(String? value) => setField<String>('CPF_Cliente', value);
}
