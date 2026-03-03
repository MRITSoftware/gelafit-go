import '../database.dart';

class TuyaHeartbeatLogsTable extends SupabaseTable<TuyaHeartbeatLogsRow> {
  @override
  String get tableName => 'tuya_heartbeat_logs';

  @override
  TuyaHeartbeatLogsRow createRow(Map<String, dynamic> data) =>
      TuyaHeartbeatLogsRow(data);
}

class TuyaHeartbeatLogsRow extends SupabaseDataRow {
  TuyaHeartbeatLogsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TuyaHeartbeatLogsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get siteId => getField<String>('site_id')!;
  set siteId(String value) => setField<String>('site_id', value);

  String? get tuyaDeviceId => getField<String>('tuya_device_id');
  set tuyaDeviceId(String? value) => setField<String>('tuya_device_id', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  DateTime get eventTime => getField<DateTime>('event_time')!;
  set eventTime(DateTime value) => setField<DateTime>('event_time', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
