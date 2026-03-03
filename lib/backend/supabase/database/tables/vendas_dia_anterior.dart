import '../database.dart';

class VendasDiaAnteriorTable extends SupabaseTable<VendasDiaAnteriorRow> {
  @override
  String get tableName => 'vendas_dia_anterior';

  @override
  VendasDiaAnteriorRow createRow(Map<String, dynamic> data) =>
      VendasDiaAnteriorRow(data);
}

class VendasDiaAnteriorRow extends SupabaseDataRow {
  VendasDiaAnteriorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasDiaAnteriorTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  DateTime? get dataVendas => getField<DateTime>('data_vendas');
  set dataVendas(DateTime? value) => setField<DateTime>('data_vendas', value);
}
