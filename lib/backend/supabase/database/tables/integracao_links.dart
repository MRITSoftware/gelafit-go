import '../database.dart';

class IntegracaoLinksTable extends SupabaseTable<IntegracaoLinksRow> {
  @override
  String get tableName => 'integracao_links';

  @override
  IntegracaoLinksRow createRow(Map<String, dynamic> data) =>
      IntegracaoLinksRow(data);
}

class IntegracaoLinksRow extends SupabaseDataRow {
  IntegracaoLinksRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IntegracaoLinksTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get nomeApi => getField<String>('nome_api');
  set nomeApi(String? value) => setField<String>('nome_api', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);
}
