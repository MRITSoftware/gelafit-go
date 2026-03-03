import '../database.dart';

class DevicesTable extends SupabaseTable<DevicesRow> {
  @override
  String get tableName => 'devices';

  @override
  DevicesRow createRow(Map<String, dynamic> data) => DevicesRow(data);
}

class DevicesRow extends SupabaseDataRow {
  DevicesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DevicesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get deviceId => getField<String>('device_id')!;
  set deviceId(String value) => setField<String>('device_id', value);

  String? get unitName => getField<String>('unit_name');
  set unitName(String? value) => setField<String>('unit_name', value);

  DateTime? get registeredAt => getField<DateTime>('registered_at');
  set registeredAt(DateTime? value) =>
      setField<DateTime>('registered_at', value);

  DateTime? get lastSeen => getField<DateTime>('last_seen');
  set lastSeen(DateTime? value) => setField<DateTime>('last_seen', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  bool? get kioskMode => getField<bool>('kiosk_mode');
  set kioskMode(bool? value) => setField<bool>('kiosk_mode', value);
}
