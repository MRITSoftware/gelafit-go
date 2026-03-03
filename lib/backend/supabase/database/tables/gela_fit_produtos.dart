import '../database.dart';

class GelaFitProdutosTable extends SupabaseTable<GelaFitProdutosRow> {
  @override
  String get tableName => 'GelaFit-Produtos';

  @override
  GelaFitProdutosRow createRow(Map<String, dynamic> data) =>
      GelaFitProdutosRow(data);
}

class GelaFitProdutosRow extends SupabaseDataRow {
  GelaFitProdutosRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GelaFitProdutosTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nome_produto');
  set nomeProduto(String? value) => setField<String>('nome_produto', value);

  String get imagem => getField<String>('imagem')!;
  set imagem(String value) => setField<String>('imagem', value);
}
