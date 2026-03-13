import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/login_cliente_c_p_f/login_c_p_f/login_c_p_f_widget.dart';
import '/paginas_login/deslogar/deslogar_widget.dart';
import '/paginas_login/sair_conta/sair_conta_widget.dart';
import '/paginas_produtos/add_carrinho_ver_produto/add_carrinho_ver_produto_widget.dart';
import '/paginas_produtos/tela_verifica_online/tela_verifica_online_widget.dart';
import '/paginas_suporte/suporte_whats_app/suporte_whats_app_widget.dart';
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'tela_principal_model.dart';
export 'tela_principal_model.dart';

class TelaPrincipalWidget extends StatefulWidget {
  const TelaPrincipalWidget({super.key});

  static String routeName = 'TelaPrincipal';
  static String routePath = '/telaPrincipal';

  @override
  State<TelaPrincipalWidget> createState() => _TelaPrincipalWidgetState();
}

class _TelaPrincipalWidgetState extends State<TelaPrincipalWidget> {
  late TelaPrincipalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaPrincipalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().timer = false;
      if (FFAppState().cpf == '') {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.viewInsetsOf(context),
              child: LoginCPFWidget(),
            );
          },
        ).then((value) => safeSetState(() {}));
        if (FFAppState().cpf != '') {
          _model.timerRegressivoController.onResetTimer();
          _model.timerRegressivoController.onStartTimer();
        }
      } else {
        _model.timerRegressivoController.onResetTimer();
        _model.timerRegressivoController.onStartTimer();
      }

      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 120000),
        callback: (timer) async {
          safeSetState(() => _model.requestCompleter2 = null);
          safeSetState(() {
            FFAppState().clearGelafitCacheKey(_model.requestLastUniqueKey1);
            _model.requestCompleted1 = false;
          });
        },
        startImmediately: true,
      );
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
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder<List<GelaFitSuzanoRow>>(
            future: FFAppState()
                .gelafit(
              uniqueQueryKey: 'todos_produtos',
              requestFn: () => GelaFitSuzanoTable().queryRows(
                queryFn: (q) => q
                    .eqOrNull(
                      'user_ref',
                      currentUserUid,
                    )
                    .gtOrNull(
                      'quantidade',
                      0,
                    )
                    .eqOrNull(
                      'destaque',
                      true,
                    )
                    .order('created_at', ascending: true),
              ),
            )
                .then((result) {
              try {
                _model.requestCompleted1 = true;
                _model.requestLastUniqueKey1 = 'todos_produtos';
              } finally {}
              return result;
            }),
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
              List<GelaFitSuzanoRow> ctnPrincipalGelaFitSuzanoRowList =
                  snapshot.data!;

              return Container(
                width: double.infinity,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4.0,
                      color: Color(0x33000000),
                      offset: Offset(
                        0.0,
                        2.0,
                      ),
                    )
                  ],
                  shape: BoxShape.rectangle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 200.0,
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Builder(
                                          builder: (context) => Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 0.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.goNamed(
                                                  TelaPrincipalWidget.routeName,
                                                  extra: <String, dynamic>{
                                                    '__transition_info__':
                                                        TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .fade,
                                                      duration: Duration(
                                                          milliseconds: 0),
                                                    ),
                                                  },
                                                );
                                              },
                                              onLongPress: () async {
                                                await Future.delayed(
                                                  Duration(
                                                    milliseconds: 3000,
                                                  ),
                                                );
                                                await showDialog(
                                                  context: context,
                                                  builder: (dialogContext) {
                                                    return Dialog(
                                                      elevation: 0,
                                                      insetPadding:
                                                          EdgeInsets.zero,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      alignment:
                                                          AlignmentDirectional(
                                                                  0.0, 0.0)
                                                              .resolve(
                                                                  Directionality.of(
                                                                      context)),
                                                      child: DeslogarWidget(),
                                                    );
                                                  },
                                                );
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  'assets/images/logo_gelafit_pdf.png',
                                                  width: 300.0,
                                                  height: 140.0,
                                                  fit: BoxFit.contain,
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Stack(
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
                                                    if (FFAppState()
                                                            .itensSacola
                                                            .length >
                                                        0) {
                                                      _model
                                                          .timerRegressivoController
                                                          .onStopTimer();

                                                      context.pushNamed(
                                                          PageCarrinhoComprasWidget
                                                              .routeName);
                                                    } else {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .clearSnackBars();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Seu carrinho está vazio',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 18.0,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Color(0xFF80CC28),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons
                                                        .shopping_cart_outlined,
                                                    color: FFAppState()
                                                                .itensSacola
                                                                .length >
                                                            0
                                                        ? Color(0xFF80CC28)
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                                if (FFAppState()
                                                        .itensSacola
                                                        .length >
                                                    0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(30.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width: 25.0,
                                                      height: 25.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF80CC28),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    3.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          FFAppState()
                                                              .itensSacola
                                                              .length
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
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
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                            Builder(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model
                                                      .timerRegressivoController
                                                      .onStopTimer();
                                                  await showDialog(
                                                    barrierColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondary,
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                        child:
                                                            SuporteWhatsAppWidget(),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.support_agent_sharp,
                                                  color: Color(0xFF80CC28),
                                                  size: 50.0,
                                                ),
                                              ),
                                            ),
                                          ]
                                              .divide(SizedBox(width: 20.0))
                                              .addToEnd(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlutterFlowTimer(
                            initialTime: _model.timerRegressivoInitialTimeMs,
                            getDisplayTime: (value) =>
                                StopWatchTimer.getDisplayTime(
                              value,
                              hours: false,
                              milliSecond: false,
                            ),
                            controller: _model.timerRegressivoController,
                            updateStateInterval: Duration(milliseconds: 1000),
                            onChanged: (value, displayTime, shouldUpdate) {
                              _model.timerRegressivoMilliseconds = value;
                              _model.timerRegressivoValue = displayTime;
                              if (shouldUpdate) safeSetState(() {});
                            },
                            onEnded: () async {
                              FFAppState().timer = false;
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                enableDrag: false,
                                useSafeArea: true,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: MediaQuery.viewInsetsOf(context),
                                    child: TelaVerificaOnlineWidget(),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              _model.timerRegressivoController.onResetTimer();
                              if (FFAppState().timer == true) {
                                _model.timerRegressivoController.onStartTimer();
                              }
                            },
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .override(
                                  font: GoogleFonts.outfit(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 1.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .fontStyle,
                                ),
                          ),
                          if (FFAppState().cpf != '')
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Olá, ${FFAppState().nomecliente}',
                                        textAlign: TextAlign.start,
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
                                              fontSize: 20.0,
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
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          if (FFAppState().cpf != '')
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.timerRegressivoController
                                      .onResetTimer();

                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: SairContaWidget(),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: Icon(
                                  Icons.logout,
                                  color: Color(0xFF80CC28),
                                  size: 35.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (ctnPrincipalGelaFitSuzanoRowList
                              .firstOrNull?.destaque ==
                          true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: GradientText(
                                  'PRODUTOS MAIS VENDIDOS',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        font: GoogleFonts.outfit(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 20.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .fontStyle,
                                      ),
                                  colors: [
                                    Color(0xFF80CC28),
                                    Color(0xFF2F4F4F)
                                  ],
                                  gradientDirection: GradientDirection.ttb,
                                  gradientType: GradientType.linear,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                          child: Visibility(
                            visible: ctnPrincipalGelaFitSuzanoRowList
                                    .firstOrNull?.destaque ==
                                true,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Builder(
                                    builder: (context) {
                                      final ctnCorpoDestaqueVar =
                                          ctnPrincipalGelaFitSuzanoRowList
                                              .toList();

                                      return Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        child: CarouselSlider.builder(
                                          itemCount: ctnCorpoDestaqueVar.length,
                                          itemBuilder: (context,
                                              ctnCorpoDestaqueVarIndex, _) {
                                            final ctnCorpoDestaqueVarItem =
                                                ctnCorpoDestaqueVar[
                                                    ctnCorpoDestaqueVarIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
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
                                                          AddCarrinhoVerProdutoWidget(
                                                        nomeproduto:
                                                            ctnCorpoDestaqueVarItem
                                                                .nomeProduto!,
                                                        imagem:
                                                            ctnCorpoDestaqueVarItem
                                                                .imagem!,
                                                        preco:
                                                            ctnCorpoDestaqueVarItem
                                                                .preco!,
                                                        id: ctnCorpoDestaqueVarItem
                                                            .id,
                                                        qtd:
                                                            ctnCorpoDestaqueVarItem
                                                                .quantidade!,
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                              child: Container(
                                                width: 210.0,
                                                height: 80.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF80CC28),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 4.0,
                                                      color: Color(0x33000000),
                                                      offset: Offset(
                                                        0.0,
                                                        2.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  border: Border.all(
                                                    color: Color(0xFF80CC28),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  ctnCorpoDestaqueVarItem
                                                                      .nomeProduto,
                                                                  '-',
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 20,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleLarge
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .outfit(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .fontStyle,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            4.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          ctnCorpoDestaqueVarItem
                                                                              .preco,
                                                                          formatType:
                                                                              FormatType.custom,
                                                                          currency:
                                                                              'R\$ ',
                                                                          format:
                                                                              '#,##0.00',
                                                                          locale:
                                                                              'pt_br',
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.readexPro(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                        ),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              ctnCorpoDestaqueVarItem
                                                                  .imagem,
                                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfqgoIUUXaEr3ypwmqL85kTRre7CLIiKeGlg&usqp=CAU',
                                                            ),
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                          carouselController:
                                              _model.carouselController ??=
                                                  CarouselSliderController(),
                                          options: CarouselOptions(
                                            initialPage: max(
                                                0,
                                                min(
                                                    1,
                                                    ctnCorpoDestaqueVar.length -
                                                        1)),
                                            viewportFraction: 0.32,
                                            disableCenter: true,
                                            enlargeCenterPage: true,
                                            enlargeFactor: 0.35,
                                            enableInfiniteScroll: true,
                                            scrollDirection: Axis.horizontal,
                                            autoPlay: true,
                                            autoPlayAnimationDuration:
                                                Duration(milliseconds: 1000),
                                            autoPlayInterval: Duration(
                                                milliseconds: (1000 + 5000)),
                                            autoPlayCurve: Curves.linear,
                                            pauseAutoPlayInFiniteScroll: true,
                                            onPageChanged: (index, _) => _model
                                                .carouselCurrentIndex = index,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child:
                                        FutureBuilder<List<GelaFitSuzanoRow>>(
                                      future: (_model.requestCompleter2 ??=
                                              Completer<
                                                  List<GelaFitSuzanoRow>>()
                                                ..complete(GelaFitSuzanoTable()
                                                    .queryRows(
                                                  queryFn: (q) => q
                                                      .eqOrNull(
                                                        'user_ref',
                                                        currentUserUid,
                                                      )
                                                      .gtOrNull(
                                                        'quantidade',
                                                        0,
                                                      )
                                                      .order('created_at',
                                                          ascending: true),
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
                                            ctnCentralProdutosGelaFitSuzanoRowList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                    ),
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            4.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final ctnCentralProdutosVar =
                                                                        ctnCentralProdutosGelaFitSuzanoRowList
                                                                            .toList();

                                                                    return ListView
                                                                        .separated(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          ctnCentralProdutosVar
                                                                              .length,
                                                                      separatorBuilder: (_,
                                                                              __) =>
                                                                          SizedBox(
                                                                              height: 20.0),
                                                                      itemBuilder:
                                                                          (context,
                                                                              ctnCentralProdutosVarIndex) {
                                                                        final ctnCentralProdutosVarItem =
                                                                            ctnCentralProdutosVar[ctnCentralProdutosVarIndex];
                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await showModalBottomSheet(
                                                                              isScrollControlled: true,
                                                                              backgroundColor: Colors.transparent,
                                                                              enableDrag: false,
                                                                              context: context,
                                                                              builder: (context) {
                                                                                return Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: AddCarrinhoVerProdutoWidget(
                                                                                    nomeproduto: ctnCentralProdutosVarItem.nomeProduto!,
                                                                                    imagem: ctnCentralProdutosVarItem.imagem!,
                                                                                    preco: ctnCentralProdutosVarItem.preco!,
                                                                                    id: ctnCentralProdutosVarItem.id,
                                                                                    qtd: ctnCentralProdutosVarItem.quantidade!,
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                150.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 4.0,
                                                                                  color: Color(0x33000000),
                                                                                  offset: Offset(
                                                                                    10.0,
                                                                                    4.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                            ),
                                                                            child:
                                                                                Visibility(
                                                                              visible: ctnCentralProdutosVarItem.quantidade! > 0,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Flexible(
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          valueOrDefault<String>(
                                                                                            ctnCentralProdutosVarItem.imagem,
                                                                                            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/gela-fit-client-ke26hw/assets/fw3w46y1dm7d/fundo-sem-imagem.png',
                                                                                          ),
                                                                                          width: 140.0,
                                                                                          height: double.infinity,
                                                                                          fit: BoxFit.contain,
                                                                                          alignment: Alignment(-1.0, 0.0),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              child: AutoSizeText(
                                                                                                valueOrDefault<String>(
                                                                                                  ctnCentralProdutosVarItem.nomeProduto,
                                                                                                  '-',
                                                                                                ).maybeHandleOverflow(
                                                                                                  maxChars: 30,
                                                                                                  replacement: '…',
                                                                                                ),
                                                                                                textAlign: TextAlign.center,
                                                                                                minFontSize: 20.0,
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
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                formatNumber(
                                                                                                  ctnCentralProdutosVarItem.preco,
                                                                                                  formatType: FormatType.custom,
                                                                                                  currency: 'R\$ ',
                                                                                                  format: '#,##0.00',
                                                                                                  locale: 'pt_br',
                                                                                                ),
                                                                                                '0',
                                                                                              ),
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                    font: GoogleFonts.outfit(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                    ),
                                                                                                    color: Colors.black,
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 4.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 4.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '© MRIT',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                    ]
                        .divide(SizedBox(height: 10.0))
                        .around(SizedBox(height: 10.0)),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
