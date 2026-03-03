import '../database.dart';

class DeviceCommandsTable extends SupabaseTable<DeviceCommandsRow> {
  @override
  String get tableName => 'device_commands';

  @override
  DeviceCommandsRow createRow(Map<String, dynamic> data) =>
      DeviceCommandsRow(data);
}

class DeviceCommandsRow extends SupabaseDataRow {
  DeviceCommandsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DeviceCommandsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get deviceId => getField<String>('device_id')!;
  set deviceId(String value) => setField<String>('device_id', value);

  String get command => getField<String>('command')!;
  set command(String value) => setField<String>('command', value);

  bool? get executed => getField<bool>('executed');
  set executed(bool? value) => setField<bool>('executed', value);

  DateTime? get executedAt => getField<DateTime>('executed_at');
  set executedAt(DateTime? value) => setField<DateTime>('executed_at', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
