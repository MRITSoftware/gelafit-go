import 'dart:async';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'auth/supabase_auth/supabase_user_provider.dart';
import 'auth/supabase_auth/auth_util.dart';

import '/backend/supabase/supabase.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'paginas_produtos/tela_verifica_online/tela_verifica_online_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await SupaFlow.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  ThemeMode _themeMode = ThemeMode.system;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;
  String getRoute([RouteMatch? routeMatch]) {
    final RouteMatch lastMatch =
        routeMatch ?? _router.routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _router.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  List<String> getRouteStack() =>
      _router.routerDelegate.currentConfiguration.matches
          .map((e) => getRoute(e))
          .toList();
  late Stream<BaseAuthUser> userStream;

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = gelaFitGOSupabaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  void setLocale(String language) {
    safeSetState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'GelaFit GO',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FallbackMaterialLocalizationDelegate(),
        FallbackCupertinoLocalizationDelegate(),
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: false,
      ),
      themeMode: _themeMode,
      builder: (context, child) {
        if (child == null) {
          return const SizedBox.shrink();
        }

        return GlobalInactivityGuard(
          router: _router,
          child: child,
        );
      },
      routerConfig: _router,
    );
  }
}

class GlobalInactivityGuard extends StatefulWidget {
  const GlobalInactivityGuard({
    super.key,
    required this.router,
    required this.child,
  });

  final GoRouter router;
  final Widget child;

  @override
  State<GlobalInactivityGuard> createState() => _GlobalInactivityGuardState();
}

class _GlobalInactivityGuardState extends State<GlobalInactivityGuard> {
  static const _timeoutDuration = Duration(minutes: 2);
  static const _sessionPollDuration = Duration(seconds: 1);

  Timer? _inactivityTimer;
  Timer? _sessionMonitorTimer;
  bool _isShowingInactivityPrompt = false;
  String _lastTrackedCpf = '';

  bool get _shouldTrackInactivity =>
      !_isShowingInactivityPrompt && FFAppState().cpf.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _sessionMonitorTimer = Timer.periodic(_sessionPollDuration, (_) {
      _syncSessionState();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncSessionState();
    });
  }

  @override
  void didUpdateWidget(covariant GlobalInactivityGuard oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncSessionState();
    });
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    _sessionMonitorTimer?.cancel();
    super.dispose();
  }

  void _handleUserInteraction([PointerEvent? _]) {
    _refreshInactivityTracking();
  }

  void _syncSessionState() {
    if (!mounted) {
      return;
    }

    final currentCpf = FFAppState().cpf;
    if (currentCpf == _lastTrackedCpf) {
      return;
    }

    _lastTrackedCpf = currentCpf;
    _refreshInactivityTracking();
  }

  void _refreshInactivityTracking() {
    _inactivityTimer?.cancel();
    if (!_shouldTrackInactivity) {
      return;
    }

    _inactivityTimer = Timer(_timeoutDuration, _showInactivityPrompt);
  }

  Future<void> _showInactivityPrompt() async {
    if (!mounted || !_shouldTrackInactivity) {
      return;
    }

    _isShowingInactivityPrompt = true;
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
    );

    _isShowingInactivityPrompt = false;

    if (!mounted) {
      return;
    }

    if (FFAppState().cpf.isNotEmpty && FFAppState().timer == true) {
      FFAppState().timer = false;
      _refreshInactivityTracking();
      return;
    }

    _inactivityTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _syncSessionState();
      }
    });

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: _handleUserInteraction,
      onPointerMove: _handleUserInteraction,
      onPointerSignal: _handleUserInteraction,
      child: widget.child,
    );
  }
}
