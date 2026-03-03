import '../database.dart';

class UltimasModificacoesTable extends SupabaseTable<UltimasModificacoesRow> {
  @override
  String get tableName => 'ultimas_modificacoes';

  @override
  UltimasModificacoesRow createRow(Map<String, dynamic> data) =>
      UltimasModificacoesRow(data);
}

class UltimasModificacoesRow extends SupabaseDataRow {
  UltimasModificacoesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UltimasModificacoesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeProduto => getField<String>('nomeProduto');
  set nomeProduto(String? value) => setField<String>('nomeProduto', value);

  double? get precoAntigo => getField<double>('precoAntigo');
  set precoAntigo(double? value) => setField<double>('precoAntigo', value);

  String? get unidade => getField<String>('unidade');
  set unidade(String? value) => setField<String>('unidade', value);

  double? get precoNovo => getField<double>('precoNovo');
  set precoNovo(double? value) => setField<double>('precoNovo', value);

  String? get nomeNovoProduto => getField<String>('nomeNovoProduto');
  set nomeNovoProduto(String? value) =>
      setField<String>('nomeNovoProduto', value);

  int? get quantidadeAntiga => getField<int>('quantidadeAntiga');
  set quantidadeAntiga(int? value) => setField<int>('quantidadeAntiga', value);

  int? get quantidadeNova => getField<int>('quantidadeNova');
  set quantidadeNova(int? value) => setField<int>('quantidadeNova', value);

  bool? get destaqueAntigo => getField<bool>('destaqueAntigo');
  set destaqueAntigo(bool? value) => setField<bool>('destaqueAntigo', value);

  bool? get destaqueNovo => getField<bool>('destaqueNovo');
  set destaqueNovo(bool? value) => setField<bool>('destaqueNovo', value);

  String? get modificadoPor => getField<String>('modificado_por');
  set modificadoPor(String? value) => setField<String>('modificado_por', value);

  String? get tipoModificacao => getField<String>('tipo_modificacao');
  set tipoModificacao(String? value) =>
      setField<String>('tipo_modificacao', value);
}
