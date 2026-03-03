import '../database.dart';

class CupomdescontoTable extends SupabaseTable<CupomdescontoRow> {
  @override
  String get tableName => 'cupomdesconto';

  @override
  CupomdescontoRow createRow(Map<String, dynamic> data) =>
      CupomdescontoRow(data);
}

class CupomdescontoRow extends SupabaseDataRow {
  CupomdescontoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CupomdescontoTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get valor => getField<int>('valor');
  set valor(int? value) => setField<int>('valor', value);

  String? get cupom => getField<String>('cupom');
  set cupom(String? value) => setField<String>('cupom', value);

  String? get unico => getField<String>('unico');
  set unico(String? value) => setField<String>('unico', value);

  String? get disponibilidade => getField<String>('disponibilidade');
  set disponibilidade(String? value) =>
      setField<String>('disponibilidade', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);

  List<String> get unidades => getListField<String>('unidades');
  set unidades(List<String>? value) => setListField<String>('unidades', value);
}
