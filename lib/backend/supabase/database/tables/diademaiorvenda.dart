import '../database.dart';

class DiademaiorvendaTable extends SupabaseTable<DiademaiorvendaRow> {
  @override
  String get tableName => 'diademaiorvenda';

  @override
  DiademaiorvendaRow createRow(Map<String, dynamic> data) =>
      DiademaiorvendaRow(data);
}

class DiademaiorvendaRow extends SupabaseDataRow {
  DiademaiorvendaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DiademaiorvendaTable();

  String? get mes => getField<String>('mes');
  set mes(String? value) => setField<String>('mes', value);

  String? get dia => getField<String>('dia');
  set dia(String? value) => setField<String>('dia', value);

  double? get totalVenda => getField<double>('total_venda');
  set totalVenda(double? value) => setField<double>('total_venda', value);

  String? get periodo => getField<String>('periodo');
  set periodo(String? value) => setField<String>('periodo', value);
}
