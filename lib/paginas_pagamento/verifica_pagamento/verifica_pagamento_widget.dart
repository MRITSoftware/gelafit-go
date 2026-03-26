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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'verifica_pagamento_model.dart';
import 'package:gela_fit_g_o/model/abertura_service.dart';
import 'package:gela_fit_g_o/model/produto.dart';
export 'verifica_pagamento_model.dart';

class VerificaPagamentoWidget extends StatefulWidget {
  const VerificaPagamentoWidget({super.key});

  static String routeName = 'VerificaPagamento';
  static String routePath = '/verificaPagamento';

  @override
  State<VerificaPagamentoWidget> createState() =>
      _VerificaPagamentoWidgetState();
}

class _VerificaPagamentoWidgetState extends State<VerificaPagamentoWidget>
    with TickerProviderStateMixin {
  late VerificaPagamentoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isCompletingApprovedFlow = false;

  final animationsMap = <String, AnimationInfo>{};

  Future<void> _completeApprovedFlow() async {
    if (_isCompletingApprovedFlow || !mounted) {
      return;
    }

    _isCompletingApprovedFlow = true;
    _model.liberaBotao = true;
    safeSetState(() {});

    _model.relatorioEnviadoRotaLocalCartao =
        await actions.envioRelatorioVendas(
      FFAppState().dtDadosRelatorio.toList(),
      true,
    );
    if (!mounted) {
      return;
    }

    // --- INTEGRAÇÃO NOVA: abrir geladeira/armário conforme produtos ---

    // Ajuste: integração real do modal de escolha

    Future<String> escolherDispositivo(BuildContext context) async {
      // Usa o modal implementado no AbrindoGeladeiraWidget
      final escolha = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Escolha o local de retirada'),
            content: Text('Você comprou produtos na geladeira e no armário. Qual deseja abrir primeiro?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop('geladeira'),
                child: Text('Geladeira'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop('armario'),
                child: Text('Armário'),
              ),
            ],
          );
        },
      );
      return escolha ?? 'geladeira';
    }

    List<Produto> produtosComprados = FFAppState()
        .dtDadosRelatorio
        .map((p) => Produto(
              id: p.nomeProduto, // Não há id, usar nome como identificador
              nome: p.nomeProduto,
              preco: p.valor,
              localizacao: (p.unidade ?? '').toLowerCase(), // unidade = geladeira/armario
              deviceId: '', // Se necessário, ajustar para buscar deviceId correto
              quantidade: p.quantidade,
            ))
        .toList();

    await fluxoAberturaComEscolha(
      produtosComprados,
      onEscolha: (msg) async => await escolherDispositivo(context),
    );

    if (!mounted) {
      return;
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: MediaQuery.viewInsetsOf(context),
            child: AbrindoGeladeiraWidget(),
          ),
        );
      },
    ).then((value) => safeSetState(() {}));
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerificaPagamentoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      _model.statusFinalPagamento = await StatusFinalMaquininhaCall.call(
        id: FFAppState().idFinalCartao,
        accessToken: FFAppState().tokenmp,
      );

      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          safeSetState(() => _model.apiRequestCompleter = null);
          _model.aprovado = await StatusFinalMaquininhaCall.call(
            id: FFAppState().idFinalCartao,
            accessToken: FFAppState().tokenmp,
          );

          if (StatusFinalMaquininhaCall.statusfinal(
                (_model.aprovado?.jsonBody ?? ''),
              ) ==
              'approved') {
            _model.instantTimer?.cancel();
            await _completeApprovedFlow();
          }
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          RotateEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 2.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 3000.0.ms,
            color: Color(0x80000000),
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
    final screenSize = MediaQuery.sizeOf(context);
    final isCompactLayout = screenSize.width < 700 || screenSize.height < 900;

    return FutureBuilder<ApiCallResponse>(
      future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
            ..complete(StatusFinalMaquininhaCall.call(
              id: FFAppState().idFinalCartao,
              accessToken: FFAppState().tokenmp,
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
        final verificaPagamentoStatusFinalMaquininhaResponse = snapshot.data!;

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
                child: SingleChildScrollView(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: isCompactLayout ? 16.0 : 32.0,
                              runSpacing: 12.0,
                              children: [
                                Container(
                                  width: isCompactLayout ? 200.0 : 250.0,
                                  height: isCompactLayout ? 96.0 : 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Image.asset(
                                    'assets/images/logo_gelafit-removebg-preview.png',
                                    width: isCompactLayout ? 200.0 : 250.0,
                                    height: isCompactLayout ? 96.0 : 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: isCompactLayout
                                      ? screenSize.width - 48.0
                                      : 100.0,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
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
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child: Padding(
                                                  padding:
                                                      MediaQuery.viewInsetsOf(
                                                          context),
                                                  child: TelaDeAjudaWidget(),
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
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
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 80.0,
                                      height: 80.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF80CC28),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Icon(
                                        Icons.sync,
                                        color: Colors.white,
                                        size: 40.0,
                                      ).animateOnPageLoad(animationsMap[
                                          'iconOnPageLoadAnimation']!),
                                    ),
                                    Text(
                                      'Verificando Pagamento',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            font: GoogleFonts.outfit(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineSmall
                                                    .fontStyle,
                                          ),
                                    ),
                                    Text(
                                      'Aguarde enquanto confirmamos sua transação...',
                                      textAlign: TextAlign.center,
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
                                                .secondaryText,
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
                                  ].divide(SizedBox(height: 16.0)),
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
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 24.0, 24.0, 24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (StatusFinalMaquininhaCall.statusfinal(
                                          verificaPagamentoStatusFinalMaquininhaResponse
                                              .jsonBody,
                                        ) ==
                                        'approved')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Pagamento Aprovado',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.green,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 12.0)),
                                        ),
                                      ),
                                    if (StatusFinalMaquininhaCall.statusfinal(
                                          verificaPagamentoStatusFinalMaquininhaResponse
                                              .jsonBody,
                                        ) ==
                                        'rejected')
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 16.0, 16.0, 16.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                              size: 25.0,
                                            ),
                                            Text(
                                              'Pagamento Recusado',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    font: GoogleFonts.readexPro(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMedium
                                                              .fontStyle,
                                                    ),
                                                    color: Colors.red,
                                                    fontSize: 20.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium
                                                            .fontStyle,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    Opacity(
                                      opacity: 0.0,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowTimer(
                                            initialTime: _model
                                                .timerPrincipalInitialTimeMs,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller:
                                                _model.timerPrincipalController,
                                            updateStateInterval:
                                                Duration(milliseconds: 500),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerPrincipalMilliseconds =
                                                  value;
                                              _model.timerPrincipalValue =
                                                  displayTime;
                                              if (shouldUpdate)
                                                safeSetState(() {});
                                            },
                                            onEnded: () async {
                                              _model.relatorioEnviadoRotaLocalCartao2 =
                                                  await actions
                                                      .envioRelatorioVendas(
                                                FFAppState()
                                                    .dtDadosRelatorio
                                                    .toList(),
                                                true,
                                              );
                                              if (_model
                                                      .relatorioEnviadoRotaLocalCartao2 ==
                                                  true) {
                                                _model.travaLocalRota1Copy =
                                                    await actions
                                                        .abrirGeladeiraComRetry(
                                                  FFAppState().deviceidplaca,
                                                  'on',
                                                  FFAppState().localKey,
                                                  FFAppState().lanIp,
                                                  currentUserEmail,
                                                  FFAppState().versionPlaca,
                                                );
                                                FFAppState().statusPlaca =
                                                    getJsonField(
                                                  _model.travaLocalRota1Copy,
                                                  r'''$.ok''',
                                                ).toString();
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            AbrindoGeladeiraWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              } else {
                                                await actions
                                                    .filaRelatorioVendasLote(
                                                  FFAppState()
                                                      .dtDadosRelatorio
                                                      .toList(),
                                                );
                                                _model.travaLocalRota2Copy =
                                                    await actions
                                                        .abrirGeladeiraComRetry(
                                                  FFAppState().deviceidplaca,
                                                  'on',
                                                  FFAppState().localKey,
                                                  FFAppState().lanIp,
                                                  currentUserEmail,
                                                  FFAppState().versionPlaca,
                                                );
                                                FFAppState().statusPlaca =
                                                    getJsonField(
                                                  _model.travaLocalRota2Copy,
                                                  r'''$.ok''',
                                                ).toString();
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(context)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            AbrindoGeladeiraWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              }

                                              safeSetState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                          FlutterFlowTimer(
                                            initialTime:
                                                _model.timerBotaoInitialTimeMs,
                                            getDisplayTime: (value) =>
                                                StopWatchTimer.getDisplayTime(
                                              value,
                                              hours: false,
                                              milliSecond: false,
                                            ),
                                            controller:
                                                _model.timerBotaoController,
                                            updateStateInterval:
                                                Duration(milliseconds: 1000),
                                            onChanged: (value, displayTime,
                                                shouldUpdate) {
                                              _model.timerBotaoMilliseconds =
                                                  value;
                                              _model.timerBotaoValue =
                                                  displayTime;
                                              if (shouldUpdate)
                                                safeSetState(() {});
                                            },
                                            onEnded: () async {
                                              _model.liberaBotao = true;
                                              safeSetState(() {});
                                            },
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                                  font: GoogleFonts.outfit(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 10.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmall
                                                          .fontStyle,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              if (StatusFinalMaquininhaCall.statusfinal(
                                    verificaPagamentoStatusFinalMaquininhaResponse
                                        .jsonBody,
                                  ) ==
                                  'rejected')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Seu pagamento não foi aprovado. \nEntre em contato com seu banco ou tente novamente',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.readexPro(
                                                fontWeight: FontWeight.normal,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.red,
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              if (StatusFinalMaquininhaCall.statusfinal(
                                    verificaPagamentoStatusFinalMaquininhaResponse
                                        .jsonBody,
                                  ) ==
                                  'approved')
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if ((StatusFinalMaquininhaCall.statusfinal(
                                              verificaPagamentoStatusFinalMaquininhaResponse
                                                  .jsonBody,
                                            ) ==
                                            'approved') &&
                                        (_model.liberaBotao == true))
                                      Expanded(
                                        child: Text(
                                          'Clique no botão abaixo para finalizar',
                                          textAlign: TextAlign.center,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                  ],
                                ),
                            ]
                                .divide(SizedBox(height: 10.0))
                                .around(SizedBox(height: 10.0)),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if ((StatusFinalMaquininhaCall.statusfinal(
                                    verificaPagamentoStatusFinalMaquininhaResponse
                                        .jsonBody,
                                  ) ==
                                  'approved') &&
                              (_model.liberaBotao == true))
                            FFButtonWidget(
                              onPressed: () async {
                                await _completeApprovedFlow();
                              },
                              text: 'CONTINUAR',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 80.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF80CC28),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.readexPro(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ).animateOnPageLoad(
                                animationsMap['buttonOnPageLoadAnimation']!),
                          if (StatusFinalMaquininhaCall.statusfinal(
                                verificaPagamentoStatusFinalMaquininhaResponse
                                    .jsonBody,
                              ) !=
                              'approved')
                            FFButtonWidget(
                              onPressed: () async {
                                _model.prodnpagosCopy =
                                    await GerarRelatorioProdNPagoCall.call(
                                  prodnpagoJson: FFAppState()
                                      .dtDadosRelatorio
                                      .map((e) => e.toMap())
                                      .toList(),
                                );

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
                                FFAppState().clearPurchaseSession(
                                  clearDeviceId: true,
                                );
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

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Pagamento Cancelado',
                                      style: TextStyle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18.0,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                    duration: Duration(milliseconds: 2500),
                                    backgroundColor: Color(0xFF80CC28),
                                  ),
                                );

                                safeSetState(() {});
                              },
                              text: 'CONTINUAR',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 80.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.notoSansJp(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 0.0,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 60.0,
                            height: 4.0,
                            decoration: BoxDecoration(
                              color: Color(0xFF80CC28),
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ].divide(SizedBox(height: 8.0)),
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
  }
}
