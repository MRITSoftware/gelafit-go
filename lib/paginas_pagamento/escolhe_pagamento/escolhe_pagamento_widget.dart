import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'escolhe_pagamento_model.dart';
export 'escolhe_pagamento_model.dart';

class EscolhePagamentoWidget extends StatefulWidget {
  const EscolhePagamentoWidget({super.key});

  @override
  State<EscolhePagamentoWidget> createState() => _EscolhePagamentoWidgetState();
}

class _EscolhePagamentoWidgetState extends State<EscolhePagamentoWidget> {
  late EscolhePagamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EscolhePagamentoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 2.0,
        sigmaY: 2.0,
      ),
      child: FutureBuilder<List<PlacasGelaFitRow>>(
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
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Color(0xFF80CC28),
                  ),
                ),
              ),
            );
          }
          List<PlacasGelaFitRow> ctnPrincipalPlacasGelaFitRowList =
              snapshot.data!;

          final ctnPrincipalPlacasGelaFitRow =
              ctnPrincipalPlacasGelaFitRowList.isNotEmpty
                  ? ctnPrincipalPlacasGelaFitRowList.first
                  : null;

          return Container(
            width: double.infinity,
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
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Escolha a forma de pagamento',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.openSans(
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 28.0,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().totalMaquininha =
                          FFAppState().totalGeral * 100;
                      FFAppState().cupom = false;
                      FFAppState().msgCupom = false;
                      safeSetState(() {});
                      await actions.formaPagamento(
                        'DÉBITO',
                      );
                      _model.pagamentoDebito =
                          await PagMaquininhaDebitoCall.call(
                        idMaquininha:
                            ctnPrincipalPlacasGelaFitRow?.idMaquininha,
                        amount: FFAppState().totalMaquininha,
                        description:
                            '${FFAppState().itensSacola.firstOrNull?.nomeProduto} Cliente: ${FFAppState().nomecliente} CPF: ${FFAppState().cpf}',
                        idempotency: random_data.randomString(
                          10,
                          15,
                          true,
                          false,
                          false,
                        ),
                        accessToken: FFAppState().tokenmp,
                      );

                      if ((_model.pagamentoDebito?.succeeded ?? false)) {
                        FFAppState().idPedidoCartao =
                            PagMaquininhaDebitoCall.idPagamentoCartao(
                          (_model.pagamentoDebito?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});

                        context.goNamed(
                          PagePagamentoCartaoWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text(
                                  'Não foi possível processar o seu pagamento. '),
                              content: Text(
                                  'Pode ser que já exista uma intenção de pagamento ativa na maquininha. Pressione o botão vermelho na maquininha e tente novamente. Se o erro persistir, entre em contato com o suporte. '),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        FFAppState().itensSacola = [];
                        FFAppState().dtDados = [];
                        FFAppState().idPedido = 0;
                        FFAppState().totalGeral = 0.0;
                        FFAppState().dtDadosRelatorio = [];
                        FFAppState().status = '';
                        FFAppState().deviceidplaca = '';
                        FFAppState().qrCode = '';
                        FFAppState().cpf = '';
                        FFAppState().nomecliente = '';
                        FFAppState().totalMaquininha = 0.0;
                        FFAppState().idPedidoCartao = '';
                        safeSetState(() {});

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
                      }

                      safeSetState(() {});
                    },
                    text: 'DÉBITO   ',
                    icon: Icon(
                      Icons.credit_score,
                      size: 35.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 100.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Colors.blue,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color: Colors.black,
                                fontSize: 25.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      FFAppState().totalMaquininha =
                          FFAppState().totalGeral * 100;
                      FFAppState().cupom = false;
                      FFAppState().msgCupom = false;
                      safeSetState(() {});
                      await actions.formaPagamento(
                        'CRÉDITO',
                      );
                      _model.pagamentoCredito =
                          await PagMaquininhaCreditoCall.call(
                        amount: FFAppState().totalMaquininha,
                        description:
                            '${FFAppState().itensSacola.firstOrNull?.nomeProduto} Cliente: ${FFAppState().nomecliente} CPF: ${FFAppState().cpf}',
                        idMaquininha:
                            ctnPrincipalPlacasGelaFitRow?.idMaquininha,
                        idempotency: random_data.randomString(
                          10,
                          15,
                          true,
                          false,
                          false,
                        ),
                        accessToken: FFAppState().tokenmp,
                      );

                      if ((_model.pagamentoCredito?.succeeded ?? false)) {
                        FFAppState().idPedidoCartao =
                            PagMaquininhaCreditoCall.idPagamentoCartao(
                          (_model.pagamentoCredito?.jsonBody ?? ''),
                        )!;
                        safeSetState(() {});

                        context.goNamed(
                          PagePagamentoCartaoWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text(
                                  'Não foi possível processar o seu pagamento. '),
                              content: Text(
                                  'Pode ser que já exista uma intenção de pagamento ativa na maquininha. Pressione o botão vermelho na maquininha e tente novamente. Se o erro persistir, entre em contato com o suporte. '),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: Text('Ok'),
                                ),
                              ],
                            );
                          },
                        );
                        FFAppState().itensSacola = [];
                        FFAppState().dtDados = [];
                        FFAppState().idPedido = 0;
                        FFAppState().totalGeral = 0.0;
                        FFAppState().dtDadosRelatorio = [];
                        FFAppState().status = '';
                        FFAppState().deviceidplaca = '';
                        FFAppState().qrCode = '';
                        FFAppState().cpf = '';
                        FFAppState().nomecliente = '';
                        FFAppState().totalMaquininha = 0.0;
                        FFAppState().idPedidoCartao = '';
                        safeSetState(() {});

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
                      }

                      safeSetState(() {});
                    },
                    text: 'CRÉDITO',
                    icon: Icon(
                      Icons.credit_score_sharp,
                      size: 35.0,
                    ),
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 100.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF66BB6A),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                                font: GoogleFonts.readexPro(
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                fontSize: 25.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                              ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  Divider(
                    thickness: 2.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancelar',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 60.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              font: GoogleFonts.lexendDeca(
                                fontWeight: FontWeight.w500,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .fontStyle,
                              ),
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: 20.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .fontStyle,
                            ),
                        elevation: 0.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                ].divide(SizedBox(height: 20.0)).around(SizedBox(height: 20.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
