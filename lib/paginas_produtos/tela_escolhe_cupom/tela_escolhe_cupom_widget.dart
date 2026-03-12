import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/paginas_produtos/tela_digita_cupom/tela_digita_cupom_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tela_escolhe_cupom_model.dart';
export 'tela_escolhe_cupom_model.dart';

class TelaEscolheCupomWidget extends StatefulWidget {
  const TelaEscolheCupomWidget({super.key});

  @override
  State<TelaEscolheCupomWidget> createState() => _TelaEscolheCupomWidgetState();
}

class _TelaEscolheCupomWidgetState extends State<TelaEscolheCupomWidget> {
  late TelaEscolheCupomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaEscolheCupomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<GelaFitUsuariosCuponsRow>>(
      future: GelaFitUsuariosCuponsTable().queryRows(
        queryFn: (q) => q.eqOrNull(
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
        List<GelaFitUsuariosCuponsRow> blurGelaFitUsuariosCuponsRowList =
            snapshot.data!;

        return ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 4.0,
              sigmaY: 4.0,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: FutureBuilder<List<CupomdescontoRow>>(
                future: CupomdescontoTable().queryRows(
                  queryFn: (q) => q
                      .containsOrNull(
                        'unidades',
                        '{${currentUserEmail}}',
                      )
                      .eqOrNull(
                        'franquia',
                        FFAppState().franquia,
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
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          color: Color(0x3B1D2429),
                          offset: Offset(
                            0.0,
                            -3.0,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 8.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.discount_outlined,
                                      color: Color(0xFF80CC28),
                                      size: 50.0,
                                    ),
                                    Text(
                                      'CUPOM',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            fontSize: 25.0,
                                            letterSpacing: 2.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            Navigator.pop(context);
                                          },
                                          child: Icon(
                                            Icons.close_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            size: 50.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 8.0, 8.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              enableDrag: false,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child:
                                                      TelaDigitaCupomWidget(),
                                                );
                                              },
                                            ).then(
                                                (value) => safeSetState(() {}));
                                          },
                                          text: 'Digitar cupom exclusivo',
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.3,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.05,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 16.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFF80CC28),
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
                                                      .primaryText,
                                                  letterSpacing: 1.0,
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
                                            elevation: 0.0,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(SizedBox(height: 15.0)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: FutureBuilder<List<CupomdescontoRow>>(
                            future: CupomdescontoTable().querySingleRow(
                              queryFn: (q) => q
                                  .containsOrNull(
                                    'unidades',
                                    '{${currentUserEmail}}',
                                  )
                                  .eqOrNull(
                                    'franquia',
                                    FFAppState().franquia,
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
                              List<CupomdescontoRow>
                                  colunaPrincipalCupomdescontoRowList =
                                  snapshot.data!;

                              final colunaPrincipalCupomdescontoRow =
                                  colunaPrincipalCupomdescontoRowList.isNotEmpty
                                      ? colunaPrincipalCupomdescontoRowList
                                          .first
                                      : null;

                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Selecione um cupom de desconto',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts
                                                            .readexPro(
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
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        fontSize: 22.0,
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
                                              ],
                                            ),
                                          ].divide(SizedBox(height: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.6,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final ctnPrincipalVar = functions
                                                          .filtrarCuponsNaoUsados(
                                                              ctnPrincipalCupomdescontoRowList
                                                                  .toList(),
                                                              blurGelaFitUsuariosCuponsRowList
                                                                  .toList())
                                                          ?.toList() ??
                                                      [];
                                                  if (ctnPrincipalVar.isEmpty) {
                                                    return Image.asset(
                                                      'assets/images/semcupom.png',
                                                      fit: BoxFit.contain,
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        ctnPrincipalVar.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 15.0),
                                                    itemBuilder: (context,
                                                        ctnPrincipalVarIndex) {
                                                      final ctnPrincipalVarItem =
                                                          ctnPrincipalVar[
                                                              ctnPrincipalVarIndex];
                                                      return Visibility(
                                                        visible:
                                                            ctnPrincipalVarIndex !=
                                                                blurGelaFitUsuariosCuponsRowList
                                                                    .firstOrNull
                                                                    ?.id,
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 3.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        16.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .height *
                                                                0.1,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFF363C44),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.cupomSelecionado =
                                                                      ctnPrincipalCupomdescontoRowList
                                                                          .elementAtOrNull(
                                                                              ctnPrincipalVarIndex)!
                                                                          .cupom!;
                                                                  _model.valorPorcentagem = ctnPrincipalCupomdescontoRowList
                                                                      .elementAtOrNull(
                                                                          ctnPrincipalVarIndex)
                                                                      ?.valor
                                                                      ?.toString();
                                                                  _model
                                                                      .valorComDesconto = ((double.parse((FFAppState().totalGeral *
                                                                              (1 - ((ctnPrincipalVarItem.valor!) ?? 0) / 100))
                                                                          .toStringAsFixed(2))))
                                                                      .toString();
                                                                  safeSetState(
                                                                      () {});
                                                                  var confirmDialogResponse =
                                                                      await showDialog<
                                                                              bool>(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title: Text('Cupom selecionado: ${_model.cupomSelecionado}'),
                                                                                content: Text('${'Este cupom é de ${_model.valorPorcentagem}%. Você pagará: '}R\$${_model.valorComDesconto} com o desconto.'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('Cancelar'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Aplicar cupom'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                          false;
                                                                  if (confirmDialogResponse) {
                                                                    if ((colunaPrincipalCupomdescontoRow
                                                                                ?.disponibilidade
                                                                                ?.trim()
                                                                                .toLowerCase() ==
                                                                            'todas') &&
                                                                        functions.mesmoCupom(
                                                                          colunaPrincipalCupomdescontoRow
                                                                              ?.cupom,
                                                                          _model
                                                                              .cupomSelecionado,
                                                                        )) {
                                                                      if ((functions.mesmoCupom(
                                                                                colunaPrincipalCupomdescontoRow?.cupom,
                                                                                _model.cupomSelecionado,
                                                                              )) &&
                                                                          (FFAppState().cpf ==
                                                                              blurGelaFitUsuariosCuponsRowList.firstOrNull?.cpf)) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Atenção'),
                                                                              content: Text('Este cupom já foi utilizado em sua conta.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      } else {
                                                                        await actions
                                                                            .aplicarCupomPersistido(
                                                                          _model
                                                                              .cupomSelecionado,
                                                                          colunaPrincipalCupomdescontoRow!
                                                                              .valor!
                                                                              .toDouble(),
                                                                          colunaPrincipalCupomdescontoRow.unico ==
                                                                              's',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      }
                                                                    } else {
                                                                      if (functions.cupomDisponivelParaCpf(
                                                                            colunaPrincipalCupomdescontoRow
                                                                                ?.disponibilidade,
                                                                            FFAppState().cpf,
                                                                          )) {
                                                                        await actions
                                                                            .aplicarCupomPersistido(
                                                                          _model
                                                                              .cupomSelecionado,
                                                                          colunaPrincipalCupomdescontoRow!
                                                                              .valor!
                                                                              .toDouble(),
                                                                          colunaPrincipalCupomdescontoRow.unico ==
                                                                              's',
                                                                        );
                                                                        safeSetState(
                                                                            () {});
                                                                      } else {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return AlertDialog(
                                                                              title: Text('Não está disponível para essa unidade'),
                                                                              content: Text('Este cupom não existe ou não está mais disponível.'),
                                                                              actions: [
                                                                                TextButton(
                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                  child: Text('Ok'),
                                                                                ),
                                                                              ],
                                                                            );
                                                                          },
                                                                        );
                                                                      }
                                                                    }

                                                                    Navigator.pop(
                                                                        context);
                                                                  }
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              '${valueOrDefault<String>(
                                                                                ctnPrincipalVarItem.valor?.toString(),
                                                                                '-',
                                                                              )}% OFF',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: Color(0xFF80CC28),
                                                                                    fontSize: 25.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            height:
                                                                                100.0,
                                                                            child:
                                                                                VerticalDivider(
                                                                              thickness: 2.0,
                                                                              color: Color(0xFF525962),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              valueOrDefault<String>(
                                                                                ctnPrincipalVarItem.cupom,
                                                                                '-',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.readexPro(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    fontSize: 20.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 50.0)).around(SizedBox(width: 50.0)),
                                                                      ),
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        _model.cupomSelecionado =
                                                                            ctnPrincipalVarItem.cupom!;
                                                                        _model.valorPorcentagem = ctnPrincipalCupomdescontoRowList
                                                                            .elementAtOrNull(ctnPrincipalVarIndex)
                                                                            ?.valor
                                                                            ?.toString();
                                                                        _model
                                                                            .valorComDesconto = ((double.parse(
                                                                                (FFAppState().totalGeral * (1 - ((ctnPrincipalVarItem.valor!) ?? 0) / 100)).toStringAsFixed(2))))
                                                                            .toString();
                                                                        safeSetState(
                                                                            () {});
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Cupom selecionado: ${_model.cupomSelecionado}'),
                                                                                  content: Text('${'Este cupom é de ${_model.valorPorcentagem}%. Você pagará: '}R\$${_model.valorComDesconto} com o desconto.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancelar'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Aplicar cupom'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                        if (confirmDialogResponse) {
                                                                          _model.cupomEscolhido =
                                                                              await GelaFitUsuariosCuponsTable().queryRows(
                                                                            queryFn: (q) => q
                                                                                .eqOrNull(
                                                                                  'cupom',
                                                                                  _model.cupomSelecionado,
                                                                                )
                                                                                .eqOrNull(
                                                                                  'CPF',
                                                                                  FFAppState().cpf,
                                                                                ),
                                                                          );
                                                                          if (_model.cupomEscolhido != null &&
                                                                              (_model.cupomEscolhido)!.isNotEmpty) {
                                                                            await showDialog(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Atenção'),
                                                                                  content: Text('Este cupom já foi utilizado em sua conta.'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                      child: Text('Ok'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          } else {
                                                                            if (functions
                                                                                    .cupomDisponivelParaUnidade(
                                                                                  colunaPrincipalCupomdescontoRow
                                                                                      ?.unidades,
                                                                                  currentUserEmail,
                                                                                ) ==
                                                                                true) {
                                                                              await actions.aplicarCupomPersistido(
                                                                                _model.cupomSelecionado,
                                                                                colunaPrincipalCupomdescontoRow!.valor!.toDouble(),
                                                                                colunaPrincipalCupomdescontoRow.unico == 's',
                                                                              );
                                                                              safeSetState(() {});

                                                                              Navigator.pop(context);
                                                                            } else {
                                                                              await showDialog(
                                                                                context: context,
                                                                                builder: (alertDialogContext) {
                                                                                  return AlertDialog(
                                                                                    title: Text('Não está disponível para essa unidade'),
                                                                                    content: Text('Este cupom não existe ou não está mais disponível.'),
                                                                                    actions: [
                                                                                      TextButton(
                                                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                                                        child: Text('Ok'),
                                                                                      ),
                                                                                    ],
                                                                                  );
                                                                                },
                                                                              );
                                                                            }
                                                                          }
                                                                        }

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Aplicar',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.25,
                                                                        height:
                                                                            45.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: Color(
                                                                            0xFF80CC28),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.readexPro(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 18.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                        elevation:
                                                                            0.0,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 10.0)),
                              );
                            },
                          ),
                        ),
                      ].divide(SizedBox(height: 50.0)),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
