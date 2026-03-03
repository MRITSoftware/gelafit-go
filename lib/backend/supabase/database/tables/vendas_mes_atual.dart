import '../database.dart';

class VendasMesAtualTable extends SupabaseTable<VendasMesAtualRow> {
  @override
  String get tableName => 'vendas_mes_atual';

  @override
  VendasMesAtualRow createRow(Map<String, dynamic> data) =>
      VendasMesAtualRow(data);
}

class VendasMesAtualRow extends SupabaseDataRow {
  VendasMesAtualRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasMesAtualTable();

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  double? get mes => getField<double>('mes');
  set mes(double? value) => setField<double>('mes', value);

  double? get totalQuantidade => getField<double>('total_quantidade');
  set totalQuantidade(double? value) =>
      setField<double>('total_quantidade', value);

  double? get totalValor => getField<double>('total_valor');
  set totalValor(double? value) => setField<double>('total_valor', value);

  String? get produtoMaisVendido => getField<String>('produto_mais_vendido');
  set produtoMaisVendido(String? value) =>
      setField<String>('produto_mais_vendido', value);

  double? get totalVendidoProduto => getField<double>('total_vendido_produto');
  set totalVendidoProduto(double? value) =>
      setField<double>('total_vendido_produto', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);
}
