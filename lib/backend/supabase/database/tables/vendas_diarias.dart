import '../database.dart';

class VendasDiariasTable extends SupabaseTable<VendasDiariasRow> {
  @override
  String get tableName => 'vendas_diarias';

  @override
  VendasDiariasRow createRow(Map<String, dynamic> data) =>
      VendasDiariasRow(data);
}

class VendasDiariasRow extends SupabaseDataRow {
  VendasDiariasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasDiariasTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  DateTime? get dataVendas => getField<DateTime>('data_vendas');
  set dataVendas(DateTime? value) => setField<DateTime>('data_vendas', value);
}
