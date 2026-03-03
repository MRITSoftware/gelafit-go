import '../database.dart';

class VendasMensaisPassadoTable extends SupabaseTable<VendasMensaisPassadoRow> {
  @override
  String get tableName => 'vendas_mensais_passado';

  @override
  VendasMensaisPassadoRow createRow(Map<String, dynamic> data) =>
      VendasMensaisPassadoRow(data);
}

class VendasMensaisPassadoRow extends SupabaseDataRow {
  VendasMensaisPassadoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasMensaisPassadoTable();

  double? get totalVendas => getField<double>('total_vendas');
  set totalVendas(double? value) => setField<double>('total_vendas', value);

  DateTime? get mesVendas => getField<DateTime>('mes_vendas');
  set mesVendas(DateTime? value) => setField<DateTime>('mes_vendas', value);
}
