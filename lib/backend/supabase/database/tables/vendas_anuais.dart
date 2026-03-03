import '../database.dart';

class VendasAnuaisTable extends SupabaseTable<VendasAnuaisRow> {
  @override
  String get tableName => 'vendas_anuais';

  @override
  VendasAnuaisRow createRow(Map<String, dynamic> data) => VendasAnuaisRow(data);
}

class VendasAnuaisRow extends SupabaseDataRow {
  VendasAnuaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasAnuaisTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  int? get anoVendas => getField<int>('ano_vendas');
  set anoVendas(int? value) => setField<int>('ano_vendas', value);
}
