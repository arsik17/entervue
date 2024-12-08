import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CountriesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'countries',
      apiUrl: 'https://restcountries.com/v3.1/all?fields=name,flags%60',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? names(dynamic response) => (getJsonField(
        response,
        r'''$[:].name.common''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class OpenaiCall {
  static Future<ApiCallResponse> call({
    String? systemPrompt = '',
    String? userPrompt = '',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "cosmosrp",
  "messages": [
    {
      "role": "system",
      "content": "${systemPrompt}"
    },
    {
      "role": "user",
      "content": "${userPrompt}"
    }
  ],
"temperature": 0.6
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'openai',
      apiUrl: 'https://api.pawan.krd/cosmosrp/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer pk-fFKmALfWlhfZWSpgqwCcpsZGQTedSJuUgoSMPAkGuCwswayw',
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

  static dynamic? content(dynamic response) => getJsonField(
        response,
        r'''$.choices[:].message''',
      );
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
  if (item is DocumentReference) {
    return item.path;
  }
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
