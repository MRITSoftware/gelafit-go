import '../database.dart';

class AvisosTable extends SupabaseTable<AvisosRow> {
  @override
  String get tableName => 'avisos';

  @override
  AvisosRow createRow(Map<String, dynamic> data) => AvisosRow(data);
}

class AvisosRow extends SupabaseDataRow {
  AvisosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AvisosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get aviso => getField<String>('aviso');
  set aviso(String? value) => setField<String>('aviso', value);
}
