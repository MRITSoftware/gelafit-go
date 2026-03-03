import '../database.dart';

class ContasTuyaTable extends SupabaseTable<ContasTuyaRow> {
  @override
  String get tableName => 'contas_tuya';

  @override
  ContasTuyaRow createRow(Map<String, dynamic> data) => ContasTuyaRow(data);
}

class ContasTuyaRow extends SupabaseDataRow {
  ContasTuyaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ContasTuyaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get label => getField<String>('label')!;
  set label(String value) => setField<String>('label', value);

  String get accessId => getField<String>('access_id')!;
  set accessId(String value) => setField<String>('access_id', value);

  String get accessKey => getField<String>('access_key')!;
  set accessKey(String value) => setField<String>('access_key', value);

  String get endpoint => getField<String>('endpoint')!;
  set endpoint(String value) => setField<String>('endpoint', value);

  String get uid => getField<String>('uid')!;
  set uid(String value) => setField<String>('uid', value);

  bool? get enabled => getField<bool>('enabled');
  set enabled(bool? value) => setField<bool>('enabled', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
