import '../database.dart';

class TuyaDeviceStatusTable extends SupabaseTable<TuyaDeviceStatusRow> {
  @override
  String get tableName => 'tuya_device_status';

  @override
  TuyaDeviceStatusRow createRow(Map<String, dynamic> data) =>
      TuyaDeviceStatusRow(data);
}

class TuyaDeviceStatusRow extends SupabaseDataRow {
  TuyaDeviceStatusRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TuyaDeviceStatusTable();

  String get deviceId => getField<String>('device_id')!;
  set deviceId(String value) => setField<String>('device_id', value);

  String? get deviceName => getField<String>('device_name');
  set deviceName(String? value) => setField<String>('device_name', value);

  String? get accountLabel => getField<String>('account_label');
  set accountLabel(String? value) => setField<String>('account_label', value);

  String? get lastStatus => getField<String>('last_status');
  set lastStatus(String? value) => setField<String>('last_status', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);
}
