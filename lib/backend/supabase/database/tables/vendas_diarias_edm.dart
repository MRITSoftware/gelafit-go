import '../database.dart';

class VendasDiariasEdmTable extends SupabaseTable<VendasDiariasEdmRow> {
  @override
  String get tableName => 'vendas_diarias_edm';

  @override
  VendasDiariasEdmRow createRow(Map<String, dynamic> data) =>
      VendasDiariasEdmRow(data);
}

class VendasDiariasEdmRow extends SupabaseDataRow {
  VendasDiariasEdmRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasDiariasEdmTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  DateTime? get dataVendas => getField<DateTime>('data_vendas');
  set dataVendas(DateTime? value) => setField<DateTime>('data_vendas', value);
}
