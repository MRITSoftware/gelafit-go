import '../database.dart';

class VendasMensaisTable extends SupabaseTable<VendasMensaisRow> {
  @override
  String get tableName => 'vendas_mensais';

  @override
  VendasMensaisRow createRow(Map<String, dynamic> data) =>
      VendasMensaisRow(data);
}

class VendasMensaisRow extends SupabaseDataRow {
  VendasMensaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasMensaisTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  DateTime? get mesVendas => getField<DateTime>('mes_vendas');
  set mesVendas(DateTime? value) => setField<DateTime>('mes_vendas', value);
}
