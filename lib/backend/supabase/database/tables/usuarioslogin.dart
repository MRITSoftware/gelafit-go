import '../database.dart';

class UsuariosloginTable extends SupabaseTable<UsuariosloginRow> {
  @override
  String get tableName => 'USUARIOSLOGIN';

  @override
  UsuariosloginRow createRow(Map<String, dynamic> data) =>
      UsuariosloginRow(data);
}

class UsuariosloginRow extends SupabaseDataRow {
  UsuariosloginRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsuariosloginTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get categoria => getField<String>('categoria');
  set categoria(String? value) => setField<String>('categoria', value);

  String? get franquia => getField<String>('franquia');
  set franquia(String? value) => setField<String>('franquia', value);

  String? get ultimoAcesso => getField<String>('ultimo_acesso');
  set ultimoAcesso(String? value) => setField<String>('ultimo_acesso', value);

  String? get vendasDoDia => getField<String>('vendasDoDia');
  set vendasDoDia(String? value) => setField<String>('vendasDoDia', value);

  String? get contatoSuporte => getField<String>('contato_suporte');
  set contatoSuporte(String? value) =>
      setField<String>('contato_suporte', value);

  String? get contatoNumero => getField<String>('contato_numero');
  set contatoNumero(String? value) => setField<String>('contato_numero', value);
}
