import '../database.dart';

class ConferenciaItensTable extends SupabaseTable<ConferenciaItensRow> {
  @override
  String get tableName => 'conferencia_itens';

  @override
  ConferenciaItensRow createRow(Map<String, dynamic> data) =>
      ConferenciaItensRow(data);
}

class ConferenciaItensRow extends SupabaseDataRow {
  ConferenciaItensRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConferenciaItensTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get conferenciaId => getField<int>('conferencia_id');
  set conferenciaId(int? value) => setField<int>('conferencia_id', value);

  String get produto => getField<String>('produto')!;
  set produto(String value) => setField<String>('produto', value);

  int? get entrada => getField<int>('entrada');
  set entrada(int? value) => setField<int>('entrada', value);

  int? get saida => getField<int>('saida');
  set saida(int? value) => setField<int>('saida', value);

  int? get geladeira => getField<int>('geladeira');
  set geladeira(int? value) => setField<int>('geladeira', value);

  int? get faltaram => getField<int>('faltaram');
  set faltaram(int? value) => setField<int>('faltaram', value);
}
