import '../database.dart';

class ConfProdutosTable extends SupabaseTable<ConfProdutosRow> {
  @override
  String get tableName => 'conf_produtos';

  @override
  ConfProdutosRow createRow(Map<String, dynamic> data) => ConfProdutosRow(data);
}

class ConfProdutosRow extends SupabaseDataRow {
  ConfProdutosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);
}
