import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/login_cliente_c_p_f/login_c_p_f/login_c_p_f_widget.dart';
import '/paginas_pagamento/escolhe_pagamento/escolhe_pagamento_widget.dart';
import '/paginas_produtos/tela_escolhe_cupom/tela_escolhe_cupom_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_tela_revisao_pagamento_model.dart';
export 'page_tela_revisao_pagamento_model.dart';

class PageTelaRevisaoPagamentoWidget extends StatefulWidget {
  const PageTelaRevisaoPagamentoWidget({super.key});

  static String routeName = 'PageTelaRevisaoPagamento';
  static String routePath = '/pageTelaRevisaoPagamento';

  @override
  State<PageTelaRevisaoPagamentoWidget> createState() =>
      _PageTelaRevisaoPagamentoWidgetState();
}

class _PageTelaRevisaoPagamentoWidgetState
    extends State<PageTelaRevisaoPagamentoWidget> {
  late PageTelaRevisaoPagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PageTelaRevisaoPagamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await PlacasGelaFitTable().update(
        data: {
          'status': 'Online',
          'updated_at': supaSerialize<DateTime>(getCurrentTimestamp),
        },
        matchingRows: (rows) => rows.eqOrNull(
          'idemail',
          currentUserUid,
        ),
      );
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<GelaFitSuzanoRow>>(
      future: (_model.requestCompleter ??= Completer<List<GelaFitSuzanoRow>>()
            ..complete(GelaFitSuzanoTable().querySingleRow(
              queryFn: (q) => q,
            )))
          .future,
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF80CC28),
                  ),
                ),
              ),
            ),
          );
        }
        List<GelaFitSuzanoRow> pageTelaRevisaoPagamentoGelaFitSuzanoRowList =
            snapshot.data!;

        final pageTelaRevisaoPagamentoGelaFitSuzanoRow =
            pageTelaRevisaoPagamentoGelaFitSuzanoRowList.isNotEmpty
                ? pageTelaRevisaoPagamentoGelaFitSuzanoRowList.first
                : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: SafeArea(
                top: true,
                child: FutureBuilder<List<CupomdescontoRow>>(
                  future: CupomdescontoTable().queryRows(
                    queryFn: (q) => q.containsOrNull(
                      'unidades',
                      '{${currentUserEmail}}',
                    ),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF80CC28),
                            ),
                          ),
                        ),
                      );
                    }
                    List<CupomdescontoRow> ctnPrincipalCupomdescontoRowList =
                        snapshot.data!;

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 1.0,
                      decoration: BoxDecoration(),
                      child: FutureBuilder<List<GelaFitUsuariosCuponsRow>>(
                        future: GelaFitUsuariosCuponsTable().queryRows(
                          queryFn: (q) => q
                              .inFilterOrNull(
                                'cupom',
                                ctnPrincipalCupomdescontoRowList
                                    .map((e) => e.cupom)
                                    .withoutNulls
                                    .toList(),
                              )
                              .eqOrNull(
                                'CPF',
                                FFAppState().cpf,
                              ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFF80CC28),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<GelaFitUsuariosCuponsRow>
                              containerGelaFitUsuariosCuponsRowList =
                              snapshot.data!;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          height: 574.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      context.safePop();
                                                    },
                                                    child: Icon(
                                                      Icons.chevron_left,
                                                      color: Colors.black,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  36.0,
                                                                  0.0),
                                                      child: Text(
                                                        'RESUMO DA COMPRA',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .readexPro(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 25.0,
                                                              letterSpacing:
                                                                  1.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final itens = FFAppState()
                                                          .itensSacola
                                                          .toList();

                                                      return ListView.separated(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 8.0),
                                                        primary: false,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount: itens.length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 8.0),
                                                        itemBuilder: (context,
                                                            itensIndex) {
                                                          final itensItem =
                                                              itens[itensIndex];
                                                          return Container(
                                                            width: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        '${valueOrDefault<String>(
                                                                          itensItem
                                                                              .imagem,
                                                                          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gela-fit-client-ke26hw/assets/fw3w46y1dm7d/fundo-sem-imagem.png',
                                                                        )}',
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    itensItem.nomeProduto,
                                                                                    '-',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.readexPro(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        FFAppState().removeAtIndexFromDtDados(itensIndex);
                                                                                        FFAppState().removeAtIndexFromDtDadosRelatorio(itensIndex);
                                                                                        FFAppState().cupom = false;
                                                                                        FFAppState().msgCupom = false;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().removeFromItensSacola(itensItem);
                                                                                        FFAppState().totalGeral = FFAppState().totalGeral + (itensItem.total * -1);
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() => _model.requestCompleter = null);
                                                                                        await actions.devolverEstoque(
                                                                                          itensItem.id,
                                                                                          1,
                                                                                        );
                                                                                        if (FFAppState().itensSacola.length == 0) {
                                                                                          await GelaFitUsuariosCuponsTable().delete(
                                                                                            matchingRows: (rows) => rows
                                                                                                .eqOrNull(
                                                                                                  'CPF',
                                                                                                  FFAppState().cpf,
                                                                                                )
                                                                                                .eqOrNull(
                                                                                                  'cupom',
                                                                                                  FFAppState().cupomInserido,
                                                                                                ),
                                                                                          );
                                                                                          FFAppState().totalGeral = 0.0;
                                                                                          FFAppState().itensSacola = [];
                                                                                          FFAppState().dtDados = [];
                                                                                          FFAppState().dtDadosRelatorio = [];
                                                                                          safeSetState(() {});
                                                                                          ScaffoldMessenger.of(context).clearSnackBars();
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Compra Cancelada',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontSize: 18.0,
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 3000),
                                                                                              backgroundColor: Color(0xFF80CC28),
                                                                                            ),
                                                                                          );

                                                                                          context.goNamed(
                                                                                            TelaTransicaoWidget.routeName,
                                                                                            extra: <String, dynamic>{
                                                                                              '__transition_info__': TransitionInfo(
                                                                                                hasTransition: true,
                                                                                                transitionType: PageTransitionType.fade,
                                                                                                duration: Duration(milliseconds: 0),
                                                                                              ),
                                                                                            },
                                                                                          );
                                                                                        } else {
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Produto Removido',
                                                                                                style: TextStyle(
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontSize: 18.0,
                                                                                                ),
                                                                                                textAlign: TextAlign.start,
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 3000),
                                                                                              backgroundColor: Color(0xFF80CC28),
                                                                                            ),
                                                                                          );
                                                                                        }
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.delete_outline,
                                                                                        color: Colors.black,
                                                                                        size: 35.0,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    '${valueOrDefault<String>(
                                                                                      itensItem.quantidadeEscolhida.toString(),
                                                                                      '-',
                                                                                    )}x ${valueOrDefault<String>(
                                                                                      formatNumber(
                                                                                        itensItem.preco,
                                                                                        formatType: FormatType.custom,
                                                                                        currency: 'R\$ ',
                                                                                        format: '#,##0.00',
                                                                                        locale: 'pt_br',
                                                                                      ),
                                                                                      '0',
                                                                                    )}',
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.readexPro(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 10.0,
                                                                                  child: VerticalDivider(
                                                                                    thickness: 1.0,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    formatNumber(
                                                                                      itensItem.total,
                                                                                      formatType: FormatType.custom,
                                                                                      currency: 'R\$ ',
                                                                                      format: '#,##0.00',
                                                                                      locale: 'pt_br',
                                                                                    ),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        font: GoogleFonts.readexPro(
                                                                                          fontWeight: FontWeight.w500,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                        ),
                                                                                        fontSize: 18.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 5.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 16.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Divider(
                                                                  thickness:
                                                                      1.0,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                              ]
                                                                  .divide(SizedBox(
                                                                      height:
                                                                          10.0))
                                                                  .around(SizedBox(
                                                                      height:
                                                                          10.0)),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ]
                                                .divide(SizedBox(height: 16.0))
                                                .around(SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (FFAppState().cupom == false)
                                              Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return GestureDetector(
                                                            onTap: () {
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus();
                                                              FocusManager
                                                                  .instance
                                                                  .primaryFocus
                                                                  ?.unfocus();
                                                            },
                                                            child: Padding(
                                                              padding: MediaQuery
                                                                  .viewInsetsOf(
                                                                      context),
                                                              child:
                                                                  TelaEscolheCupomWidget(),
                                                            ),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));
                                                    },
                                                    text:
                                                        'Aplicar cupom de desconto (${(ctnPrincipalCupomdescontoRowList.length - containerGelaFitUsuariosCuponsRowList.length).toString()})',
                                                    icon: Icon(
                                                      Icons.local_play_sharp,
                                                      size: 25.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 50.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Total',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .readexPro(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                              fontSize: 25.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                      ),
                                                      if (FFAppState().cupom ==
                                                          true)
                                                        Text(
                                                          'com desconto aplicado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                fontSize: 25.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                    ].divide(
                                                        SizedBox(width: 8.0)),
                                                  ),
                                                  Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        FFAppState().totalGeral,
                                                        formatType:
                                                            FormatType.custom,
                                                        currency: 'R\$ ',
                                                        format: '#,##0.00',
                                                        locale: 'pt_br',
                                                      ),
                                                      '0',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 25.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (FFAppState().cupom == true)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'Cupom aplicado: ${FFAppState().cupomInserido}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ]
                                              .divide(SizedBox(height: 5.0))
                                              .around(SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  FutureBuilder<List<PlacasGelaFitRow>>(
                                    future: PlacasGelaFitTable().querySingleRow(
                                      queryFn: (q) => q.eqOrNull(
                                        'idemail',
                                        currentUserUid,
                                      ),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                Color(0xFF80CC28),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<PlacasGelaFitRow>
                                          ctnEscolhePagamentoPlacasGelaFitRowList =
                                          snapshot.data!;

                                      final ctnEscolhePagamentoPlacasGelaFitRow =
                                          ctnEscolhePagamentoPlacasGelaFitRowList
                                                  .isNotEmpty
                                              ? ctnEscolhePagamentoPlacasGelaFitRowList
                                                  .first
                                              : null;

                                      return Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (ctnEscolhePagamentoPlacasGelaFitRow
                                                        ?.bloqPagPIX ==
                                                    false)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 1000,
                                                        ),
                                                      );
                                                      if (FFAppState().cpf !=
                                                              '') {
                                                        await actions
                                                            .formaPagamento(
                                                          'PIX',
                                                        );
                                                        _model.gerarPix =
                                                            await PagamentoPIXCall
                                                                .call(
                                                          idempotency:
                                                              random_data
                                                                  .randomString(
                                                            10,
                                                            15,
                                                            true,
                                                            true,
                                                            true,
                                                          ),
                                                          transactionAmount:
                                                              valueOrDefault<
                                                                  double>(
                                                            FFAppState()
                                                                .totalGeral,
                                                            0.0,
                                                          ),
                                                          description:
                                                              '${FFAppState().itensSacola.length.toString()} item(ns) comprado(s)Cliente: ${FFAppState().nomecliente} CPF: ${FFAppState().cpf}',
                                                          accessToken:
                                                              FFAppState()
                                                                  .tokenmp,
                                                        );

                                                        if ((_model.gerarPix
                                                                ?.succeeded ??
                                                            true)) {
                                                          FFAppState().qrCode =
                                                              PagamentoPIXCall
                                                                  .qrCode(
                                                            (_model.gerarPix
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          FFAppState()
                                                                  .idPedido =
                                                              PagamentoPIXCall
                                                                  .idPedido(
                                                            (_model.gerarPix
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          FFAppState()
                                                                  .totalGeral =
                                                              FFAppState()
                                                                  .totalGeral;
                                                          FFAppState().status =
                                                              PagamentoPIXCall
                                                                  .status(
                                                            (_model.gerarPix
                                                                    ?.jsonBody ??
                                                                ''),
                                                          )!;
                                                          FFAppState().cupom =
                                                              false;
                                                          FFAppState()
                                                              .msgCupom = false;
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            PagePagamentoPIXWidget
                                                                .routeName,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Erro'),
                                                                content: Text(
                                                                    'Não foi possível processar o seu pagamento via PIX. Por favor, entre em contato com o suporte. Erro: ${PagamentoPIXCall.msgErro(
                                                                  (_model.gerarPix
                                                                          ?.jsonBody ??
                                                                      ''),
                                                                )}'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed: () =>
                                                                        Navigator.pop(
                                                                            alertDialogContext),
                                                                    child: Text(
                                                                        'Ok'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                          FFAppState()
                                                              .itensSacola = [];
                                                          FFAppState().dtDados =
                                                              [];
                                                          FFAppState()
                                                              .idPedido = 0;
                                                          FFAppState()
                                                              .totalGeral = 0.0;
                                                          FFAppState()
                                                              .dtDadosRelatorio = [];
                                                          FFAppState().status =
                                                              '';
                                                          FFAppState()
                                                              .deviceidplaca = '';
                                                          FFAppState().qrCode =
                                                              '';
                                                          FFAppState().cpf = '';
                                                          FFAppState()
                                                              .nomecliente = '';
                                                          FFAppState().cupom =
                                                              false;
                                                          FFAppState()
                                                              .msgCupom = false;
                                                          safeSetState(() {});

                                                          context.goNamed(
                                                            TelaTransicaoWidget
                                                                .routeName,
                                                            extra: <String,
                                                                dynamic>{
                                                              '__transition_info__':
                                                                  TransitionInfo(
                                                                hasTransition:
                                                                    true,
                                                                transitionType:
                                                                    PageTransitionType
                                                                        .fade,
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        0),
                                                              ),
                                                            },
                                                          );

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Compra Cancelada. Se houve algum problema, entre em contato com o suporte',
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      18.0,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2500),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFFEAAD07),
                                                            ),
                                                          );
                                                        }
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Atenção'),
                                                              content: Text(
                                                                  'Para realizar a compra, é preciso fazer o login.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    LoginCPFWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }

                                                      safeSetState(() {});
                                                    },
                                                    text: 'PAGAR COM PIX',
                                                    icon: Icon(
                                                      Icons.pix,
                                                      size: 40.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Colors.blue,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                Divider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                ),
                                                if (ctnEscolhePagamentoPlacasGelaFitRow
                                                        ?.bloqPagCartao ==
                                                    false)
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 1000,
                                                        ),
                                                      );
                                                      if (FFAppState().cpf !=
                                                              '') {
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    EscolhePagamentoWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      } else {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: Text(
                                                                  'Atenção'),
                                                              content: Text(
                                                                  'Para realizar a compra, é preciso fazer o login.'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                        await showModalBottomSheet(
                                                          isScrollControlled:
                                                              true,
                                                          backgroundColor:
                                                              Colors
                                                                  .transparent,
                                                          enableDrag: false,
                                                          context: context,
                                                          builder: (context) {
                                                            return GestureDetector(
                                                              onTap: () {
                                                                FocusScope.of(
                                                                        context)
                                                                    .unfocus();
                                                                FocusManager
                                                                    .instance
                                                                    .primaryFocus
                                                                    ?.unfocus();
                                                              },
                                                              child: Padding(
                                                                padding: MediaQuery
                                                                    .viewInsetsOf(
                                                                        context),
                                                                child:
                                                                    LoginCPFWidget(),
                                                              ),
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            safeSetState(
                                                                () {}));
                                                      }
                                                    },
                                                    text: 'PAGAR COM CARTÃO',
                                                    icon: Icon(
                                                      Icons.credit_card_sharp,
                                                      size: 40.0,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: double.infinity,
                                                      height: 60.0,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      color: Color(0xFF66BB6A),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .readexPro(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .fontStyle,
                                                                ),
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    1.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                              ),
                                                      elevation: 3.0,
                                                      borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                              ]
                                                  .divide(
                                                      SizedBox(height: 15.0))
                                                  .around(
                                                      SizedBox(height: 15.0)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        FFButtonWidget(
                                          onPressed: () async {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Cancelar compra'),
                                                          content: Text(
                                                              'Tem certeza que deseja cancelar a sua compra?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Não, continuar comprando'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child: Text(
                                                                  'Sim, cancelar minha compra'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (confirmDialogResponse) {
                                              await actions.devolverCarrinho(
                                                FFAppState()
                                                    .itensSacola
                                                    .toList(),
                                              );
                                              await GelaFitUsuariosCuponsTable()
                                                  .delete(
                                                matchingRows: (rows) => rows
                                                    .eqOrNull(
                                                      'CPF',
                                                      FFAppState().cpf,
                                                    )
                                                    .eqOrNull(
                                                      'cupom',
                                                      FFAppState()
                                                          .cupomInserido,
                                                    ),
                                              );
                                              FFAppState().dtDados = [];
                                              FFAppState().totalGeral = 0.0;
                                              FFAppState().itensSacola = [];
                                              FFAppState().deviceidplaca = '';
                                              FFAppState().idPedido = 0;
                                              FFAppState().qrCode = '';
                                              FFAppState().status = '';
                                              FFAppState().dtDadosRelatorio =
                                                  [];
                                              FFAppState().cpf = '';
                                              FFAppState().nomecliente = '';
                                              safeSetState(() {});

                                              context.goNamed(
                                                TelaTransicaoWidget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Compra Cancelada',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18.0,
                                                    ),
                                                    textAlign:
                                                        TextAlign.justify,
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 2500),
                                                  backgroundColor:
                                                      Color(0xFF80CC28),
                                                ),
                                              );
                                            }
                                          },
                                          text: 'CANCELAR COMPRA',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 35.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmall
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .success,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .fontStyle,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 10.0))
                                          .around(SizedBox(height: 10.0)),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '© MRIT',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.readexPro(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ].divide(SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
