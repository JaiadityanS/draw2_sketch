import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Replicate API Group Code

class ReplicateAPIGroup {
  static String baseUrl = 'https://api.replicate.com/v1';
  static Map<String, String> headers = {
    'Authorization': 'Token [API_KEY_HERE]',
  };
  static CreatePredictionCall createPredictionCall = CreatePredictionCall();
  static GetPredictionCall getPredictionCall = GetPredictionCall();
}

class CreatePredictionCall {
  Future<ApiCallResponse> call({
    String? prompt = '',
    String? imageURL = '',
  }) {
    final body = '''
{
  "version": "435061a1b5a4c1e26740464bf786efdfa9cb3a3ac488595a2de23e143fdb0117",
  "model": "jagilley/controlnet-scribble",
  "input": {
    "image": "${imageURL}",
    "prompt": "${prompt}",
    "num_samples": "1",
    "image_resolution": "512",
    "ddim_steps": 20,
    "scale": 9,
    "a_prompt": "best quality, extremely detailed",
    "n_prompt": "longbody, lowres, bad anatomy, bad hands, missing fingers, extra digit, fewer digits, cropped, worst quality, low quality"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Create Prediction',
      apiUrl: '${ReplicateAPIGroup.baseUrl}/predictions',
      callType: ApiCallType.POST,
      headers: {
        ...ReplicateAPIGroup.headers,
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class GetPredictionCall {
  Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get Prediction',
      apiUrl: '${ReplicateAPIGroup.baseUrl}/predictions/${id}',
      callType: ApiCallType.GET,
      headers: {
        ...ReplicateAPIGroup.headers,
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  dynamic outputImageURLs(dynamic response) => getJsonField(
        response,
        r'''$.output''',
        true,
      );
  dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
}

/// End Replicate API Group Code

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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
