import '../database.dart';

class EstoqueMaximoUnidadeTable extends SupabaseTable<EstoqueMaximoUnidadeRow> {
  @override
  String get tableName => 'estoque_maximo_unidade';

  @override
  EstoqueMaximoUnidadeRow createRow(Map<String, dynamic> data) =>
      EstoqueMaximoUnidadeRow(data);
}

class EstoqueMaximoUnidadeRow extends SupabaseDataRow {
  EstoqueMaximoUnidadeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EstoqueMaximoUnidadeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get unidade => getField<String>('unidade')!;
  set unidade(String value) => setField<String>('unidade', value);

  int get produtoId => getField<int>('produto_id')!;
  set produtoId(int value) => setField<int>('produto_id', value);

  int get quantidadeMaxima => getField<int>('quantidade_maxima')!;
  set quantidadeMaxima(int value) => setField<int>('quantidade_maxima', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
