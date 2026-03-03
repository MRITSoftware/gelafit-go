import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class PagamentoPIXCall {
  static Future<ApiCallResponse> call({
    String? accessToken = '',
    String? idempotency = '231323213',
    String? description = '-',
    double? transactionAmount,
    String? email = 'redegelafit@gmail.com',
    String? firstName = 'GelaFit',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "description": "${description}",
  "payment_method_id": "pix",
  "payer": {
    "email": "${email}",
    "first_name": "${firstName}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pagamento PIX',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'X-Idempotency-Key': '${idempotency}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? qrCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.point_of_interaction.transaction_data.qr_code''',
      ));
  static int? idPedido(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? msgErro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class StatusPixCall {
  static Future<ApiCallResponse> call({
    String? idPix = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Pix',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${idPix}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? esperando(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status_detail''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class GerarRelatorioProdNPagoCall {
  static Future<ApiCallResponse> call({
    dynamic prodnpagoJson,
  }) async {
    final prodnpago = _serializeJson(prodnpagoJson, true);
    final ffApiRequestBody = '''
${prodnpago}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gerar Relatorio Prod N Pago',
      apiUrl:
          'https://kihyhoqbrkwbfudttevo.supabase.co/rest/v1/GelaFit-Relatorio-NaoPagos',
      callType: ApiCallType.POST,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpaHlob3Ficmt3YmZ1ZHR0ZXZvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU1NTUwMjcsImV4cCI6MjAzMTEzMTAyN30.XtBTlSiqhsuUIKmhAMEyxofV-dRst7240n912m4O4Us',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PagMaquininhaDebitoCall {
  static Future<ApiCallResponse> call({
    double? amount,
    String? description = 'GelaFit',
    String? accessToken = '',
    String? userId = '1794822069',
    String? idempotency = '231323213',
    String? idMaquininha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "description": "${escapeStringForJson(description)}",
  "payment": {
    "type": "debit_card"
  },
  "additional_info": {
    "external_reference": "4561ads-das4das4-das4754-das456",
    "print_on_terminal": true
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pag Maquininha Debito',
      apiUrl:
          'https://api.mercadopago.com/point/integration-api/devices/GERTEC_MP35P__${idMaquininha}/payment-intents',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'X-Idempotency-Key': '${idempotency}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? idPagamentoCartao(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static String? mensagemErro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
  static int? numErro(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class PagMaquininhaCreditoCall {
  static Future<ApiCallResponse> call({
    double? amount,
    String? description = 'GelaFit',
    String? accessToken = '',
    String? userId = '1794822069',
    String? idempotency = '231323213',
    String? idMaquininha = '',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "description": "${escapeStringForJson(description)}",
  "payment": {
    "installments": 1,
    "type": "credit_card"
  },
  "additional_info": {
    "external_reference": "4561ads-das4das4-das4754-das456",
    "print_on_terminal": true
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Pag Maquininha Credito',
      apiUrl:
          'https://api.mercadopago.com/point/integration-api/devices/GERTEC_MP35P__${idMaquininha}/payment-intents',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
        'X-Idempotency-Key': '${idempotency}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? idPagamentoCartao(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? erro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.error''',
      ));
  static int? numErro(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? mensagemErro(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class StatusPagCartaoCall {
  static Future<ApiCallResponse> call({
    String? paymentintentid = '0',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Pag Cartao',
      apiUrl:
          'https://api.mercadopago.com/point/integration-api/payment-intents/${paymentintentid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
  static String? idDoPagamento(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? idStatusFinal(dynamic response) {
    final value = getJsonField(
      response,
      r'''$.payment.id''',
    );
    return value?.toString();
  }
}

class CancelarPagamentoMaquininhaCall {
  static Future<ApiCallResponse> call({
    String? paymentintentid = '',
    String? deviceid = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'CancelarPagamentoMaquininha',
      apiUrl:
          'https://api.mercadopago.com/point/integration-api/devices/GERTEC_MP35P__${deviceid}/payment-intents/${paymentintentid}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class StatusFinalMaquininhaCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Status Final Maquininha',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? statusfinal(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
