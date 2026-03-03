import '../database.dart';

class TutoriaisTable extends SupabaseTable<TutoriaisRow> {
  @override
  String get tableName => 'tutoriais';

  @override
  TutoriaisRow createRow(Map<String, dynamic> data) => TutoriaisRow(data);
}

class TutoriaisRow extends SupabaseDataRow {
  TutoriaisRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TutoriaisTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('nome');
  set nome(String? value) => setField<String>('nome', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);
}
