import '../database.dart';

class ConferenciaTable extends SupabaseTable<ConferenciaRow> {
  @override
  String get tableName => 'conferencia';

  @override
  ConferenciaRow createRow(Map<String, dynamic> data) => ConferenciaRow(data);
}

class ConferenciaRow extends SupabaseDataRow {
  ConferenciaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConferenciaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get dataField => getField<DateTime>('data')!;
  set dataField(DateTime value) => setField<DateTime>('data', value);

  String get unidade => getField<String>('unidade')!;
  set unidade(String value) => setField<String>('unidade', value);
}
