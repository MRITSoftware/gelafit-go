import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _deviceidplaca = prefs.getString('ff_deviceidplaca') ?? _deviceidplaca;
    });
    _safeInit(() {
      _unid = prefs.getString('ff_unid') ?? _unid;
    });
    _safeInit(() {
      _franquia = prefs.getString('ff_franquia') ?? _franquia;
    });
    _safeInit(() {
      _lanIp = prefs.getString('ff_lanIp') ?? _lanIp;
    });
    _safeInit(() {
      _versionPlaca = prefs.getString('ff_versionPlaca') ?? _versionPlaca;
    });
    _safeInit(() {
      _localKey = prefs.getString('ff_localKey') ?? _localKey;
    });
    _safeInit(() {
      _imagemContato = prefs.getString('ff_imagemContato') ?? _imagemContato;
    });
    _safeInit(() {
      _telefoneContato =
          prefs.getString('ff_telefoneContato') ?? _telefoneContato;
    });
    _safeInit(() {
      _cartCount = prefs.getInt('ff_cartCount') ?? _cartCount;
    });
    _safeInit(() {
      prefs.remove('ff_tokenmp');
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  void clearPurchaseSession({
    bool clearDeviceId = false,
    bool clearPaymentFinalId = true,
  }) {
    update(() {
      _totalGeral = 0.0;
      _itensSacola = [];
      _dtDados = [];
      _idPedido = 0;
      _qrCode = '';
      _status = '';
      _dtDadosRelatorio = [];
      _cpf = '';
      _nomecliente = '';
      _fazerpagamento = false;
      _totalMaquininha = 0.0;
      _idPedidoCartao = '';
      _formapagamento = '';
      _cupom = false;
      _msgCupom = false;
      _cupomInserido = '-';
      if (clearPaymentFinalId) {
        _idFinalCartao = '';
      }
      if (clearDeviceId) {
        deviceidplaca = '';
        unid = '';
        franquia = '';
        lanIp = '';
        versionPlaca = '';
        localKey = '';
        imagemContato = '';
        telefoneContato = '';
      }
    });
  }

  late SharedPreferences prefs;

  double _totalGeral = 0.0;
  double get totalGeral => _totalGeral;
  set totalGeral(double value) {
    _totalGeral = value;
  }

  List<DtprodutosStruct> _itensSacola = [];
  List<DtprodutosStruct> get itensSacola => _itensSacola;
  set itensSacola(List<DtprodutosStruct> value) {
    _itensSacola = value;
  }

  void addToItensSacola(DtprodutosStruct value) {
    itensSacola.add(value);
  }

  void removeFromItensSacola(DtprodutosStruct value) {
    itensSacola.remove(value);
  }

  void removeAtIndexFromItensSacola(int index) {
    itensSacola.removeAt(index);
  }

  void updateItensSacolaAtIndex(
    int index,
    DtprodutosStruct Function(DtprodutosStruct) updateFn,
  ) {
    itensSacola[index] = updateFn(_itensSacola[index]);
  }

  void insertAtIndexInItensSacola(int index, DtprodutosStruct value) {
    itensSacola.insert(index, value);
  }

  List<DtprodutosStruct> _dtDados = [];
  List<DtprodutosStruct> get dtDados => _dtDados;
  set dtDados(List<DtprodutosStruct> value) {
    _dtDados = value;
  }

  void addToDtDados(DtprodutosStruct value) {
    dtDados.add(value);
  }

  void removeFromDtDados(DtprodutosStruct value) {
    dtDados.remove(value);
  }

  void removeAtIndexFromDtDados(int index) {
    dtDados.removeAt(index);
  }

  void updateDtDadosAtIndex(
    int index,
    DtprodutosStruct Function(DtprodutosStruct) updateFn,
  ) {
    dtDados[index] = updateFn(_dtDados[index]);
  }

  void insertAtIndexInDtDados(int index, DtprodutosStruct value) {
    dtDados.insert(index, value);
  }

  String _deviceidplaca = '';
  String get deviceidplaca => _deviceidplaca;
  set deviceidplaca(String value) {
    _deviceidplaca = value;
    prefs.setString('ff_deviceidplaca', value);
  }

  int _idPedido = 0;
  int get idPedido => _idPedido;
  set idPedido(int value) {
    _idPedido = value;
  }

  String _qrCode = '';
  String get qrCode => _qrCode;
  set qrCode(String value) {
    _qrCode = value;
  }

  String _status = '';
  String get status => _status;
  set status(String value) {
    _status = value;
  }

  List<DtDadosStruct> _dtDadosRelatorio = [];
  List<DtDadosStruct> get dtDadosRelatorio => _dtDadosRelatorio;
  set dtDadosRelatorio(List<DtDadosStruct> value) {
    _dtDadosRelatorio = value;
  }

  void addToDtDadosRelatorio(DtDadosStruct value) {
    dtDadosRelatorio.add(value);
  }

  void removeFromDtDadosRelatorio(DtDadosStruct value) {
    dtDadosRelatorio.remove(value);
  }

  void removeAtIndexFromDtDadosRelatorio(int index) {
    dtDadosRelatorio.removeAt(index);
  }

  void updateDtDadosRelatorioAtIndex(
    int index,
    DtDadosStruct Function(DtDadosStruct) updateFn,
  ) {
    dtDadosRelatorio[index] = updateFn(_dtDadosRelatorio[index]);
  }

  void insertAtIndexInDtDadosRelatorio(int index, DtDadosStruct value) {
    dtDadosRelatorio.insert(index, value);
  }

  String _cpf = '';
  String get cpf => _cpf;
  set cpf(String value) {
    _cpf = value;
  }

  String _nomecliente = '';
  String get nomecliente => _nomecliente;
  set nomecliente(String value) {
    _nomecliente = value;
  }

  String _mensagemTelaLogin = '';
  String get mensagemTelaLogin => _mensagemTelaLogin;
  set mensagemTelaLogin(String value) {
    _mensagemTelaLogin = value;
  }

  bool _fazerpagamento = false;
  bool get fazerpagamento => _fazerpagamento;
  set fazerpagamento(bool value) {
    _fazerpagamento = value;
  }

  double _totalMaquininha = 0.0;
  double get totalMaquininha => _totalMaquininha;
  set totalMaquininha(double value) {
    _totalMaquininha = value;
  }

  String _idPedidoCartao = '';
  String get idPedidoCartao => _idPedidoCartao;
  set idPedidoCartao(String value) {
    _idPedidoCartao = value;
  }

  String _formapagamento = '';
  String get formapagamento => _formapagamento;
  set formapagamento(String value) {
    _formapagamento = value;
  }

  bool _cupom = false;
  bool get cupom => _cupom;
  set cupom(bool value) {
    _cupom = value;
  }

  String _idFinalCartao = '';
  String get idFinalCartao => _idFinalCartao;
  set idFinalCartao(String value) {
    _idFinalCartao = value;
  }

  String _linkPlaca = '';
  String get linkPlaca => _linkPlaca;
  set linkPlaca(String value) {
    _linkPlaca = value;
  }

  bool _msgCupom = false;
  bool get msgCupom => _msgCupom;
  set msgCupom(bool value) {
    _msgCupom = value;
  }

  bool _timer = false;
  bool get timer => _timer;
  set timer(bool value) {
    _timer = value;
  }

  String _unid = '';
  String get unid => _unid;
  set unid(String value) {
    _unid = value;
    prefs.setString('ff_unid', value);
  }

  int _cartCount = 0;
  int get cartCount => _cartCount;
  set cartCount(int value) {
    _cartCount = value;
    prefs.setInt('ff_cartCount', value);
  }

  String _cupomInserido = '-';
  String get cupomInserido => _cupomInserido;
  set cupomInserido(String value) {
    _cupomInserido = value;
  }

  /// token maquininha
  String _tokenmp = '';
  String get tokenmp => _tokenmp;
  set tokenmp(String value) {
    _tokenmp = value;
  }

  String _franquia = '';
  String get franquia => _franquia;
  set franquia(String value) {
    _franquia = value;
    prefs.setString('ff_franquia', value);
  }

  bool _pulseAPI = false;
  bool get pulseAPI => _pulseAPI;
  set pulseAPI(bool value) {
    _pulseAPI = value;
  }

  dynamic _pulseResultado = jsonDecode('200');
  dynamic get pulseResultado => _pulseResultado;
  set pulseResultado(dynamic value) {
    _pulseResultado = value;
  }

  String _lanIp = '';
  String get lanIp => _lanIp;
  set lanIp(String value) {
    _lanIp = value;
    prefs.setString('ff_lanIp', value);
  }

  String _versionPlaca = '';
  String get versionPlaca => _versionPlaca;
  set versionPlaca(String value) {
    _versionPlaca = value;
    prefs.setString('ff_versionPlaca', value);
  }

  String _localKey = '';
  String get localKey => _localKey;
  set localKey(String value) {
    _localKey = value;
    prefs.setString('ff_localKey', value);
  }

  String _imagemContato = '';
  String get imagemContato => _imagemContato;
  set imagemContato(String value) {
    _imagemContato = value;
    prefs.setString('ff_imagemContato', value);
  }

  String _telefoneContato = '';
  String get telefoneContato => _telefoneContato;
  set telefoneContato(String value) {
    _telefoneContato = value;
    prefs.setString('ff_telefoneContato', value);
  }

  bool get hasCachedSafePlateConfig =>
      _deviceidplaca.isNotEmpty &&
      _unid.isNotEmpty &&
      _franquia.isNotEmpty &&
      _lanIp.isNotEmpty &&
      _versionPlaca.isNotEmpty &&
      _localKey.isNotEmpty;

  String _statusPlaca = '';
  String get statusPlaca => _statusPlaca;
  set statusPlaca(String value) {
    _statusPlaca = value;
  }

  String _linkVideo = '';
  String get linkVideo => _linkVideo;
  set linkVideo(String value) {
    _linkVideo = value;
  }

  int _inactivityResetToken = 0;
  int get inactivityResetToken => _inactivityResetToken;
  set inactivityResetToken(int value) {
    _inactivityResetToken = value;
  }

  final _gelafitManager = FutureRequestManager<List<GelaFitSuzanoRow>>();
  Future<List<GelaFitSuzanoRow>> gelafit({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<GelaFitSuzanoRow>> Function() requestFn,
  }) =>
      _gelafitManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGelafitCache() => _gelafitManager.clear();
  void clearGelafitCacheKey(String? uniqueKey) =>
      _gelafitManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
