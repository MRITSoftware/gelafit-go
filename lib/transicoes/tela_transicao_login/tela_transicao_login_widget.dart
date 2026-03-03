import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tela_transicao_login_model.dart';
export 'tela_transicao_login_model.dart';

class TelaTransicaoLoginWidget extends StatefulWidget {
  const TelaTransicaoLoginWidget({super.key});

  static String routeName = 'TelaTransicaoLogin';
  static String routePath = '/telaTransicaoLogin';

  @override
  State<TelaTransicaoLoginWidget> createState() =>
      _TelaTransicaoLoginWidgetState();
}

class _TelaTransicaoLoginWidgetState extends State<TelaTransicaoLoginWidget>
    with TickerProviderStateMixin {
  late TelaTransicaoLoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaTransicaoLoginModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.logado = await PlacasGelaFitTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'email',
              currentUserEmail,
            ),
          );
          FFAppState().unid = _model.logado!.firstOrNull!.unidgelafit!;
          FFAppState().tokenmp = _model.logado!.firstOrNull!.tkMaquininha!;
          FFAppState().franquia = _model.logado!.firstOrNull!.idFranquia!;
          FFAppState().imagemContato =
              _model.logado!.firstOrNull!.contatoSuporte!;
          FFAppState().telefoneContato =
              _model.logado!.firstOrNull!.numeroSuporte!;
          safeSetState(() {});
          await PlacasGelaFitTable().update(
            data: {
              'info_versao': 'v5.2.5 - ${dateTimeFormat(
                "d/M h:mm a",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              )}',
            },
            matchingRows: (rows) => rows.eqOrNull(
              'idemail',
              currentUserUid,
            ),
          );
          _model.attLocal = await TuyaDevicesTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'site_id',
              currentUserEmail,
            ),
          );
          FFAppState().lanIp = _model.attLocal!.firstOrNull!.lanIp!;
          FFAppState().versionPlaca =
              _model.attLocal!.firstOrNull!.protocolVersion!;
          FFAppState().localKey = _model.attLocal!.firstOrNull!.localKey!;
          safeSetState(() {});

          context.goNamed(
            TelaPrincipalWidget.routeName,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1400.0.ms,
            color: Color(0xFF80CC28),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          await Future.delayed(
            Duration(
              milliseconds: 1000,
            ),
          );
          _model.logadoTentativa2 = await PlacasGelaFitTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'email',
              currentUserEmail,
            ),
          );
          FFAppState().unid = _model.logado!.firstOrNull!.unidgelafit!;
          FFAppState().tokenmp = _model.logado!.firstOrNull!.tkMaquininha!;
          FFAppState().franquia = _model.logado!.firstOrNull!.idFranquia!;
          FFAppState().imagemContato =
              _model.logado!.firstOrNull!.contatoSuporte!;
          FFAppState().telefoneContato =
              _model.logado!.firstOrNull!.numeroSuporte!;
          safeSetState(() {});
          await PlacasGelaFitTable().update(
            data: {
              'info_versao': 'v5.2.5 - ${dateTimeFormat(
                "d/M h:mm a",
                getCurrentTimestamp,
                locale: FFLocalizations.of(context).languageCode,
              )}',
            },
            matchingRows: (rows) => rows.eqOrNull(
              'idemail',
              currentUserUid,
            ),
          );
          _model.attLocal1 = await TuyaDevicesTable().queryRows(
            queryFn: (q) => q.eqOrNull(
              'tuya_device_id',
              FFAppState().deviceidplaca,
            ),
          );
          FFAppState().lanIp = _model.attLocal!.firstOrNull!.lanIp!;
          FFAppState().versionPlaca =
              _model.attLocal!.firstOrNull!.protocolVersion!;
          FFAppState().localKey = _model.attLocal!.firstOrNull!.localKey!;
          safeSetState(() {});

          context.goNamed(
            TelaPrincipalWidget.routeName,
            extra: <String, dynamic>{
              '__transition_info__': TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );

          safeSetState(() {});
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/logo_gelafit_pdf.png',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,
                ),
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Carregando, aguarde...',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.readexPro(
                            fontWeight: FontWeight.w300,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 25.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w300,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
