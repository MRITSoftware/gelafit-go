import '../database.dart';

class VendasResumoHojeSpTable extends SupabaseTable<VendasResumoHojeSpRow> {
  @override
  String get tableName => 'vendas_resumo_hoje_sp';

  @override
  VendasResumoHojeSpRow createRow(Map<String, dynamic> data) =>
      VendasResumoHojeSpRow(data);
}

class VendasResumoHojeSpRow extends SupabaseDataRow {
  VendasResumoHojeSpRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VendasResumoHojeSpTable();

  DateTime? get diaSp => getField<DateTime>('dia_sp');
  set diaSp(DateTime? value) => setField<DateTime>('dia_sp', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);

  int? get total => getField<int>('total');
  set total(int? value) => setField<int>('total', value);

  int? get pix => getField<int>('pix');
  set pix(int? value) => setField<int>('pix', value);

  int? get debito => getField<int>('debito');
  set debito(int? value) => setField<int>('debito', value);

  int? get credito => getField<int>('credito');
  set credito(int? value) => setField<int>('credito', value);
}
