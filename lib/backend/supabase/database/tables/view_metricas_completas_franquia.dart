import '../database.dart';

class ViewMetricasCompletasFranquiaTable
    extends SupabaseTable<ViewMetricasCompletasFranquiaRow> {
  @override
  String get tableName => 'view_metricas_completas_franquia';

  @override
  ViewMetricasCompletasFranquiaRow createRow(Map<String, dynamic> data) =>
      ViewMetricasCompletasFranquiaRow(data);
}

class ViewMetricasCompletasFranquiaRow extends SupabaseDataRow {
  ViewMetricasCompletasFranquiaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ViewMetricasCompletasFranquiaTable();

  String? get nomeFranquia => getField<String>('nome_franquia');
  set nomeFranquia(String? value) => setField<String>('nome_franquia', value);

  double? get vendasHoje => getField<double>('vendas_hoje');
  set vendasHoje(double? value) => setField<double>('vendas_hoje', value);

  double? get vendasOntem => getField<double>('vendas_ontem');
  set vendasOntem(double? value) => setField<double>('vendas_ontem', value);

  double? get vendasMesAtual => getField<double>('vendas_mes_atual');
  set vendasMesAtual(double? value) =>
      setField<double>('vendas_mes_atual', value);

  double? get vendasMesPassado => getField<double>('vendas_mes_passado');
  set vendasMesPassado(double? value) =>
      setField<double>('vendas_mes_passado', value);

  double? get vendasAnoAtual => getField<double>('vendas_ano_atual');
  set vendasAnoAtual(double? value) =>
      setField<double>('vendas_ano_atual', value);

  double? get vendasAnoPassado => getField<double>('vendas_ano_passado');
  set vendasAnoPassado(double? value) =>
      setField<double>('vendas_ano_passado', value);

  double? get totalGeral => getField<double>('total_geral');
  set totalGeral(double? value) => setField<double>('total_geral', value);

  int? get qtdVendasHoje => getField<int>('qtd_vendas_hoje');
  set qtdVendasHoje(int? value) => setField<int>('qtd_vendas_hoje', value);

  int? get qtdVendasOntem => getField<int>('qtd_vendas_ontem');
  set qtdVendasOntem(int? value) => setField<int>('qtd_vendas_ontem', value);

  DateTime? get atualizadoEm => getField<DateTime>('atualizado_em');
  set atualizadoEm(DateTime? value) =>
      setField<DateTime>('atualizado_em', value);

  String? get dataOntem => getField<String>('data_ontem');
  set dataOntem(String? value) => setField<String>('data_ontem', value);

  String? get mesAtual => getField<String>('mes_atual');
  set mesAtual(String? value) => setField<String>('mes_atual', value);

  String? get anoAtual => getField<String>('ano_atual');
  set anoAtual(String? value) => setField<String>('ano_atual', value);

  String? get mesPassado => getField<String>('mes_passado');
  set mesPassado(String? value) => setField<String>('mes_passado', value);
}
