import '../database.dart';

class PlacasGelaFitTable extends SupabaseTable<PlacasGelaFitRow> {
  @override
  String get tableName => 'Placas-GelaFit';

  @override
  PlacasGelaFitRow createRow(Map<String, dynamic> data) =>
      PlacasGelaFitRow(data);
}

class PlacasGelaFitRow extends SupabaseDataRow {
  PlacasGelaFitRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PlacasGelaFitTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get deviceId => getField<String>('device_id');
  set deviceId(String? value) => setField<String>('device_id', value);

  String? get idemail => getField<String>('idemail');
  set idemail(String? value) => setField<String>('idemail', value);

  String? get unidgelafit => getField<String>('unidgelafit');
  set unidgelafit(String? value) => setField<String>('unidgelafit', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get senha => getField<String>('senha');
  set senha(String? value) => setField<String>('senha', value);

  String? get clienteuser => getField<String>('clienteuser');
  set clienteuser(String? value) => setField<String>('clienteuser', value);

  String? get cPFCliente => getField<String>('CPF_Cliente');
  set cPFCliente(String? value) => setField<String>('CPF_Cliente', value);

  String? get mensagemTelaLogin => getField<String>('mensagemTelaLogin');
  set mensagemTelaLogin(String? value) =>
      setField<String>('mensagemTelaLogin', value);

  String? get imagemTelaInicial => getField<String>('imagemTelaInicial');
  set imagemTelaInicial(String? value) =>
      setField<String>('imagemTelaInicial', value);

  String? get idFranquia => getField<String>('id_franquia');
  set idFranquia(String? value) => setField<String>('id_franquia', value);

  String? get idMaquininha => getField<String>('id_maquininha');
  set idMaquininha(String? value) => setField<String>('id_maquininha', value);

  bool? get manutencao => getField<bool>('manutencao');
  set manutencao(bool? value) => setField<bool>('manutencao', value);

  String? get infoVersao => getField<String>('info_versao');
  set infoVersao(String? value) => setField<String>('info_versao', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get tkMaquininha => getField<String>('tk_maquininha');
  set tkMaquininha(String? value) => setField<String>('tk_maquininha', value);

  bool? get bloqPagCartao => getField<bool>('bloq_pagCartao');
  set bloqPagCartao(bool? value) => setField<bool>('bloq_pagCartao', value);

  bool? get bloqPagPIX => getField<bool>('bloq_pagPIX');
  set bloqPagPIX(bool? value) => setField<bool>('bloq_pagPIX', value);

  bool? get pulseAPI => getField<bool>('PulseAPI');
  set pulseAPI(bool? value) => setField<bool>('PulseAPI', value);

  String? get contatoSuporte => getField<String>('contatoSuporte');
  set contatoSuporte(String? value) =>
      setField<String>('contatoSuporte', value);

  String? get numeroSuporte => getField<String>('numeroSuporte');
  set numeroSuporte(String? value) => setField<String>('numeroSuporte', value);
}
