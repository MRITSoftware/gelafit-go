import '../database.dart';

class TuyaDevicesTable extends SupabaseTable<TuyaDevicesRow> {
  @override
  String get tableName => 'tuya_devices';

  @override
  TuyaDevicesRow createRow(Map<String, dynamic> data) => TuyaDevicesRow(data);
}

class TuyaDevicesRow extends SupabaseDataRow {
  TuyaDevicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TuyaDevicesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get siteId => getField<String>('site_id')!;
  set siteId(String value) => setField<String>('site_id', value);

  String get tuyaDeviceId => getField<String>('tuya_device_id')!;
  set tuyaDeviceId(String value) => setField<String>('tuya_device_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get localKey => getField<String>('local_key');
  set localKey(String? value) => setField<String>('local_key', value);

  String? get lanIp => getField<String>('lan_ip');
  set lanIp(String? value) => setField<String>('lan_ip', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get protocolVersion => getField<String>('protocol_version');
  set protocolVersion(String? value) =>
      setField<String>('protocol_version', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get servidorOnline => getField<DateTime>('servidor_online');
  set servidorOnline(DateTime? value) =>
      setField<DateTime>('servidor_online', value);

  String? get wifiSsid => getField<String>('wifi_ssid');
  set wifiSsid(String? value) => setField<String>('wifi_ssid', value);

  int? get wifiSpeed => getField<int>('wifi_speed');
  set wifiSpeed(int? value) => setField<int>('wifi_speed', value);

  int? get batteryLevel => getField<int>('battery_level');
  set batteryLevel(int? value) => setField<int>('battery_level', value);
}
