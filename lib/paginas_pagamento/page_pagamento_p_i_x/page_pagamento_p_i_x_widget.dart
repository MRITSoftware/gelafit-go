import '/auth/supabase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/paginas_pagamento/abrindo_geladeira/abrindo_geladeira_widget.dart';
import '/paginas_suporte/tela_de_ajuda/tela_de_ajuda_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'dart:async';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'page_pagamento_p_i_x_model.dart';
export 'page_pagamento_p_i_x_model.dart';

class PagePagamentoPIXWidget extends StatefulWidget {
  const PagePagamentoPIXWidget({super.key});

  static String routeName = 'PagePagamentoPIX';
  static String routePath = '/pagePagamentoPIX';

  @override
  State<PagePagamentoPIXWidget> createState() => _PagePagamentoPIXWidgetState();
}

class _PagePagamentoPIXWidgetState extends State<PagePagamentoPIXWidget>
    with TickerProviderStateMixin {
  late PagePagamentoPIXModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PagePagamentoPIXModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      _model.contagemRegressivaController.onStartTimer();
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          safeSetState(() => _model.apiRequestCompleter = null);
        },
        startImmediately: true,
      );
    });

    _model.txtFieldOCULTOTOTALGERALTextController ??=
        TextEditingController(text: FFAppState().totalGeral.toString());
    _model.txtFieldOCULTOTOTALGERALFocusNode ??= FocusNode();

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 710.0.ms,
            duration: 1310.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: FutureBuilder<ApiCallResponse>(
              future:
                  (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
                        ..complete(StatusPixCall.call(
                          idPix: FFAppState().idPedido.toString(),
                          accessToken: FFAppState().tokenmp,
                        )))
                      .future,
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
                final colunaPrincipalStatusPixResponse = snapshot.data!;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/logo_gelafit-removebg-preview.png',
                              width: 250.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Precisa de ajuda?',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.readexPro(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 45.0,
                                  fillColor: Colors.black,
                                  icon: Icon(
                                    Icons.back_hand,
                                    color: FlutterFlowTheme.of(context).info,
                                    size: 20.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: TelaDeAjudaWidget(),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Opacity(
                                      opacity: 0.0,
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: TextFormField(
                                          controller: _model
                                              .txtFieldOCULTOTOTALGERALTextController,
                                          focusNode: _model
                                              .txtFieldOCULTOTOTALGERALFocusNode,
                                          autofocus: false,
                                          readOnly: true,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Label here...',
                                            enabledBorder: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            focusedErrorBorder:
                                                InputBorder.none,
                                          ),
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
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          validator: _model
                                              .txtFieldOCULTOTOTALGERALTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              if (StatusPixCall.status(
                                    colunaPrincipalStatusPixResponse.jsonBody,
                                  ) ==
                                  'pending')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.circle_sharp,
                                      color: Color(0xFFFF0000),
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Pagamento Pendente',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF5722),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                    FlutterFlowTimer(
                                      initialTime: _model
                                          .contagemRegressivaInitialTimeMs,
                                      getDisplayTime: (value) =>
                                          StopWatchTimer.getDisplayTime(
                                        value,
                                        hours: false,
                                        milliSecond: false,
                                      ),
                                      controller:
                                          _model.contagemRegressivaController,
                                      updateStateInterval:
                                          Duration(milliseconds: 180000),
                                      onChanged:
                                          (value, displayTime, shouldUpdate) {
                                        _model.contagemRegressivaMilliseconds =
                                            value;
                                        _model.contagemRegressivaValue =
                                            displayTime;
                                        if (shouldUpdate) safeSetState(() {});
                                      },
                                      onEnded: () async {
                                        await Future.delayed(
                                          Duration(
                                            milliseconds: 1000,
                                          ),
                                        );
                                        _model.apiResultfmh =
                                            await StatusPixCall.call(
                                          idPix:
                                              FFAppState().idPedido.toString(),
                                        );

                                        if (StatusPixCall.status(
                                              colunaPrincipalStatusPixResponse
                                                  .jsonBody,
                                            ) ==
                                            'pending') {
                                          await actions.devolverCarrinho(
                                            FFAppState().itensSacola.toList(),
                                          );

                                          context.goNamed(
                                            TelaPrincipalWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
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
                                          safeSetState(() {});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Tempo de Pagamento Expirado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 25.0,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2500),
                                              backgroundColor:
                                                  Color(0xFF80CC28),
                                            ),
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .around(SizedBox(width: 10.0)),
                                ),
                              if (StatusPixCall.status(
                                    colunaPrincipalStatusPixResponse.jsonBody,
                                  ) ==
                                  'approved')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Color(0xFF80CC28),
                                      size: 24.0,
                                    ),
                                    Text(
                                      'Pagamento Aprovado',
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFFFF5722),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 10.0))
                                      .around(SizedBox(width: 10.0)),
                                ),
                            ]
                                .divide(SizedBox(height: 5.0))
                                .around(SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (StatusPixCall.status(
                                    colunaPrincipalStatusPixResponse.jsonBody,
                                  ) !=
                                  'approved')
                                Expanded(
                                  child: BarcodeWidget(
                                    data: FFAppState().qrCode,
                                    barcode: Barcode.qrCode(),
                                    width: 350.0,
                                    height: 350.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    backgroundColor: Colors.transparent,
                                    errorBuilder: (_context, _error) =>
                                        SizedBox(
                                      width: 350.0,
                                      height: 350.0,
                                    ),
                                    drawText: false,
                                  ),
                                ),
                            ],
                          ),
                          Material(
                            color: Colors.transparent,
                            elevation: 4.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Divider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context).accent4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (StatusPixCall.status(
                                            colunaPrincipalStatusPixResponse
                                                .jsonBody,
                                          ) ==
                                          'pending')
                                        Text(
                                          'Aponte sua câmera e leia o QR Code com o app de seu banco',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.readexPro(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                fontSize: 20.0,
                                                letterSpacing: 1.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                    ],
                                  ),
                                  if (StatusPixCall.status(
                                        colunaPrincipalStatusPixResponse
                                            .jsonBody,
                                      ) ==
                                      'pending')
                                    Text(
                                      'Após o pagamento, aguarde a confirmação.',
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.readexPro(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 15.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  if (StatusPixCall.status(
                                        colunaPrincipalStatusPixResponse
                                            .jsonBody,
                                      ) ==
                                      'pending')
                                    FFButtonWidget(
                                      onPressed: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      content: Text(
                                                          'Tem certeza que seja cancelar a compra?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text(
                                                              'Cancelar a compra'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text(
                                                              'Continuar com pagamento'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          await actions.devolverCarrinho(
                                            FFAppState().itensSacola.toList(),
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
                                                  FFAppState().cupomInserido,
                                                ),
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
                                          FFAppState().cupom = false;
                                          FFAppState().cupomInserido = '-';
                                          safeSetState(() {});

                                          context.goNamed(
                                            TelaTransicaoWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Pagamento Cancelado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0,
                                                ),
                                                textAlign: TextAlign.start,
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2500),
                                              backgroundColor: Colors.green,
                                            ),
                                          );
                                        }
                                      },
                                      text: 'Cancelar Pagamento',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 60.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF4DFFEA),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Color(0xFF020202),
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                  Material(
                                    color: Colors.transparent,
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              if (StatusPixCall.status(
                                                    colunaPrincipalStatusPixResponse
                                                        .jsonBody,
                                                  ) ==
                                                  'approved')
                                                Expanded(
                                                  child: Text(
                                                    'Clique no botão abaixo para abrir a geladeira e retirar seu produto',
                                                    textAlign: TextAlign.center,
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 18.0,
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
                                                ),
                                            ],
                                          ),
                                          if (StatusPixCall.status(
                                                colunaPrincipalStatusPixResponse
                                                    .jsonBody,
                                              ) ==
                                              'approved')
                                            FutureBuilder<
                                                List<GelaFitSuzanoRow>>(
                                              future: GelaFitSuzanoTable()
                                                  .queryRows(
                                                queryFn: (q) => q,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child:
                                                          CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                                Color>(
                                                          Color(0xFF80CC28),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<GelaFitSuzanoRow>
                                                    btnAbrirGeladeiraGelaFitSuzanoRowList =
                                                    snapshot.data!;

                                                return FFButtonWidget(
                                                  onPressed: () async {
                                                    _model
                                                        .contagemRegressivaController
                                                        .onStopTimer();
                                                    _model.relatorioEnviadoRotaLocalPIX =
                                                        await actions
                                                            .envioRelatorioVendas(
                                                      FFAppState()
                                                          .dtDadosRelatorio
                                                          .toList(),
                                                      true,
                                                    );
                                                    if (_model
                                                            .relatorioEnviadoRotaLocalPIX ==
                                                        true) {
                                                      _model.travaLocalRota1 =
                                                          await actions
                                                              .tuyaLocal(
                                                        FFAppState()
                                                            .deviceidplaca,
                                                        'on',
                                                        FFAppState().localKey,
                                                        FFAppState().lanIp,
                                                        currentUserEmail,
                                                        FFAppState()
                                                            .versionPlaca,
                                                      );
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AbrindoGeladeiraWidget(),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      FFAppState().statusPlaca =
                                                          getJsonField(
                                                        _model.travaLocalRota1,
                                                        r'''$.ok''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                    } else {
                                                      await actions
                                                          .filaRelatorioVendasLote(
                                                        FFAppState()
                                                            .dtDadosRelatorio
                                                            .toList(),
                                                      );
                                                      _model.travaLocalRota2 =
                                                          await actions
                                                              .tuyaLocal(
                                                        FFAppState()
                                                            .deviceidplaca,
                                                        'on',
                                                        FFAppState().localKey,
                                                        FFAppState().lanIp,
                                                        currentUserEmail,
                                                        FFAppState()
                                                            .versionPlaca,
                                                      );
                                                      await showModalBottomSheet(
                                                        isScrollControlled:
                                                            true,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        enableDrag: false,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child:
                                                                AbrindoGeladeiraWidget(),
                                                          );
                                                        },
                                                      ).then((value) =>
                                                          safeSetState(() {}));

                                                      FFAppState().statusPlaca =
                                                          getJsonField(
                                                        _model.travaLocalRota2,
                                                        r'''$.ok''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                    }

                                                    safeSetState(() {});
                                                  },
                                                  text: 'CONTINUAR',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 80.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                24.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Color(0xFF80CC28),
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          font: GoogleFonts
                                                              .readexPro(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .fontStyle,
                                                          ),
                                                          color: Colors.black,
                                                          fontSize: 20.0,
                                                          letterSpacing: 2.0,
                                                          fontWeight:
                                                              FontWeight.w600,
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
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ).animateOnPageLoad(animationsMap[
                                                    'buttonOnPageLoadAnimation']!);
                                              },
                                            ),
                                        ].divide(SizedBox(height: 10.0)),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(height: 15.0))
                                    .around(SizedBox(height: 15.0)),
                              ),
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 15.0))
                            .around(SizedBox(height: 15.0)),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          '© MRIT',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.readexPro(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).success,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                        Container(
                          width: 60.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: Color(0xFF80CC28),
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                      ].divide(SizedBox(height: 5.0)),
                    ),
                  ]
                      .divide(SizedBox(height: 20.0))
                      .around(SizedBox(height: 20.0)),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
