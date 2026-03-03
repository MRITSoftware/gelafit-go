import '../database.dart';

class GelaFitUsuariosCuponsTable
    extends SupabaseTable<GelaFitUsuariosCuponsRow> {
  @override
  String get tableName => 'GelaFit-UsuariosCupons';

  @override
  GelaFitUsuariosCuponsRow createRow(Map<String, dynamic> data) =>
      GelaFitUsuariosCuponsRow(data);
}

class GelaFitUsuariosCuponsRow extends SupabaseDataRow {
  GelaFitUsuariosCuponsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GelaFitUsuariosCuponsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get cpf => getField<String>('CPF');
  set cpf(String? value) => setField<String>('CPF', value);

  String? get cupom => getField<String>('cupom');
  set cupom(String? value) => setField<String>('cupom', value);

  int? get valorCupom => getField<int>('valorCupom');
  set valorCupom(int? value) => setField<int>('valorCupom', value);
}
