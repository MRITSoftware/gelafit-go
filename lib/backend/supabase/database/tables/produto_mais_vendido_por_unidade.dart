import '../database.dart';

class ProdutoMaisVendidoPorUnidadeTable
    extends SupabaseTable<ProdutoMaisVendidoPorUnidadeRow> {
  @override
  String get tableName => 'ProdutoMaisVendidoPorUnidade';

  @override
  ProdutoMaisVendidoPorUnidadeRow createRow(Map<String, dynamic> data) =>
      ProdutoMaisVendidoPorUnidadeRow(data);
}

class ProdutoMaisVendidoPorUnidadeRow extends SupabaseDataRow {
  ProdutoMaisVendidoPorUnidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProdutoMaisVendidoPorUnidadeTable();

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  double? get totalVendido => getField<double>('total_vendido');
  set totalVendido(double? value) => setField<double>('total_vendido', value);
}
