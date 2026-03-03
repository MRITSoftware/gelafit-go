import '../database.dart';

class DataDeValidadeTable extends SupabaseTable<DataDeValidadeRow> {
  @override
  String get tableName => 'Data de Validade';

  @override
  DataDeValidadeRow createRow(Map<String, dynamic> data) =>
      DataDeValidadeRow(data);
}

class DataDeValidadeRow extends SupabaseDataRow {
  DataDeValidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DataDeValidadeTable();

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  DateTime? get dataValidade => getField<DateTime>('dataValidade');
  set dataValidade(DateTime? value) =>
      setField<DateTime>('dataValidade', value);

  String? get imagem => getField<String>('imagem');
  set imagem(String? value) => setField<String>('imagem', value);

  DateTime? get dataAtual => getField<DateTime>('data_atual');
  set dataAtual(DateTime? value) => setField<DateTime>('data_atual', value);

  int? get diasRestantes => getField<int>('dias_restantes');
  set diasRestantes(int? value) => setField<int>('dias_restantes', value);
}
