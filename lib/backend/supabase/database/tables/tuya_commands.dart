import '../database.dart';

class TuyaCommandsTable extends SupabaseTable<TuyaCommandsRow> {
  @override
  String get tableName => 'tuya_commands';

  @override
  TuyaCommandsRow createRow(Map<String, dynamic> data) => TuyaCommandsRow(data);
}

class TuyaCommandsRow extends SupabaseDataRow {
  TuyaCommandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TuyaCommandsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get siteId => getField<String>('site_id')!;
  set siteId(String value) => setField<String>('site_id', value);

  String get tuyaDeviceId => getField<String>('tuya_device_id')!;
  set tuyaDeviceId(String value) => setField<String>('tuya_device_id', value);

  String get action => getField<String>('action')!;
  set action(String value) => setField<String>('action', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get errorMsg => getField<String>('error_msg');
  set errorMsg(String? value) => setField<String>('error_msg', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get executedAt => getField<DateTime>('executed_at');
  set executedAt(DateTime? value) => setField<DateTime>('executed_at', value);
}
