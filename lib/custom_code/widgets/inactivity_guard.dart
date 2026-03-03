// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';

class InactivityGuard extends StatefulWidget {
  const InactivityGuard({
    super.key,
    this.width,
    this.height,

    // Widget filho (envolva sua tela/conteúdo dentro)
    required this.child,

    // Tempo para considerar inativo e iniciar o countdown
    this.idleSeconds = 15,

    // Tempo do countdown (2 minutos = 120s)
    this.countdownSeconds = 120,

    // Ação para abrir seu Bottom Sheet quando o countdown terminar
    this.openBottomSheetAction,
  });

  final double? width;
  final double? height;

  final Widget child;

  final int idleSeconds;
  final int countdownSeconds;

  /// Conecte aqui a Action do FlutterFlow que abre seu Bottom Sheet
  /// (ex.: Open Bottom Sheet -> TelaVerificaOnline)
  final Future Function()? openBottomSheetAction;

  @override
  State<InactivityGuard> createState() => _InactivityGuardState();
}

class _InactivityGuardState extends State<InactivityGuard> {
  Timer? _idleTimer;
  Timer? _countdownTimer;

  void _cancelTimers() {
    _idleTimer?.cancel();
    _countdownTimer?.cancel();
    _idleTimer = null;
    _countdownTimer = null;
  }

  void _startIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(Duration(seconds: widget.idleSeconds), () {
      // Ficou inativo por 15s -> inicia countdown de 2 minutos
      _startCountdownTimer();
    });
  }

  void _startCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer =
        Timer(Duration(seconds: widget.countdownSeconds), () async {
      // Terminou o countdown -> abre bottom sheet
      if (widget.openBottomSheetAction != null) {
        await widget.openBottomSheetAction!.call();
      }

      // Depois de abrir, reinicia o ciclo (para voltar a monitorar)
      _cancelTimers();
      _startIdleTimer();
    });
  }

  void _onUserInteraction() {
    // Qualquer interação reseta tudo: cancela countdown e volta para idle
    _countdownTimer?.cancel();
    _countdownTimer = null;

    _startIdleTimer();
  }

  @override
  void initState() {
    super.initState();
    _startIdleTimer();
  }

  @override
  void dispose() {
    _cancelTimers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Listener(
        behavior: HitTestBehavior.translucent,
        onPointerDown: (_) => _onUserInteraction(),
        onPointerMove: (_) => _onUserInteraction(),
        onPointerSignal: (_) => _onUserInteraction(), // scroll do mouse etc.
        child: widget.child,
      ),
    );
  }
}
