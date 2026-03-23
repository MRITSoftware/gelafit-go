import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'tela_transicao_model.dart';
export 'tela_transicao_model.dart';

class TelaTransicaoWidget extends StatefulWidget {
  const TelaTransicaoWidget({super.key});

  static String routeName = 'TelaTransicao';
  static String routePath = '/telaTransicao';

  @override
  State<TelaTransicaoWidget> createState() => _TelaTransicaoWidgetState();
}

class _TelaTransicaoWidgetState extends State<TelaTransicaoWidget>
    with TickerProviderStateMixin {
  late TelaTransicaoModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  Future<void> _goToMainScreen() async {
    if (!mounted) {
      return;
    }

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
  }

  Future<void> _refreshPlateConfig() async {
    _model.logado = await PlacasGelaFitTable().queryRows(
      queryFn: (q) => q
          .eqOrNull(
            'email',
            currentUserEmail,
          )
          .eqOrNull(
            'idemail',
            currentUserUid,
          ),
    );

    final placa = _model.logado?.firstOrNull;
    if (placa == null) {
      return;
    }

    FFAppState().deviceidplaca = placa.deviceId ?? '';
    FFAppState().unid = placa.unidgelafit ?? '';
    FFAppState().franquia = placa.idFranquia ?? '';
    FFAppState().tokenmp = placa.tkMaquininha ?? '';
    FFAppState().imagemContato = placa.contatoSuporte ?? '';
    FFAppState().telefoneContato = placa.numeroSuporte ?? '';

    final tuyaRows = await TuyaDevicesTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'site_id',
        currentUserEmail,
      ),
    );
    final tuya = tuyaRows.firstOrNull;
    if (tuya != null) {
      FFAppState().lanIp = tuya.lanIp ?? '';
      FFAppState().versionPlaca = tuya.protocolVersion ?? '';
      FFAppState().localKey = tuya.localKey ?? '';
    }
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TelaTransicaoModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().hasCachedSafePlateConfig) {
        unawaited(_refreshPlateConfig());
        await _goToMainScreen();
        return;
      }

      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          await _refreshPlateConfig();
          safeSetState(() {});
          await _goToMainScreen();
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'imageOnPageLoadAnimation': AnimationInfo(
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
            ],
          ),
        ),
      ),
    );
  }
}
