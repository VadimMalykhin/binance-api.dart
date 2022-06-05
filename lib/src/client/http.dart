import 'dart:io';

import 'package:dio/dio.dart';

import '../exceptions/exceptions.dart';
import '../extensions/uri.dart';
import '../models/models.dart';
import '../utils.dart';

const int _kDefaultConnectTimeout = Duration.millisecondsPerMinute;
const int _kDefaultReceiveTimeout = Duration.millisecondsPerMinute;

/// HTTP Client
mixin HttpClient {
  bool _debug = false;

  /// Set Debug for the request
  void setDebug(bool debug) => _debug = debug;

  /// Request
  Future makeRequest(
    String path,
    Uri endpoint, {
    String method = 'GET',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    CredentialsModel? credentials,
    bool? addTimestamp = false,
  }) async {
    try {
      final dio = Dio()
        ..options.connectTimeout = _kDefaultConnectTimeout
        ..options.receiveTimeout = _kDefaultReceiveTimeout
        ..options.followRedirects = false
        ..options.headers = {
          ...{'Accept': 'application/json'},
          ...?headers
        }
        ..options.validateStatus = (int? status) => status != null && status < 500;

      // Logging
      if (_debug) {
        dio.interceptors.add(LogInterceptor(responseHeader: true, responseBody: false));
      }

      var uri = endpoint.withSuffixPath(path);

      if (addTimestamp != null && addTimestamp == true) {
        queryParameters = {
          ...?queryParameters,
          ...{'timestamp': DateTime.now().millisecondsSinceEpoch.toString()}
        };
        uri = uri.withQueryParameters(queryParameters);
      }

      // Signed request
      if (credentials != null) {
        if (credentials.apiKey.isEmpty || credentials.apiSecret.isEmpty) {
          throw BinanceApiCredentialsException('The API key or secret is not set.', 100);
        }

        dio.options.headers = {
          ...dio.options.headers,
          'X-MBX-APIKEY': credentials.apiKey,
        };
        uri = uri.withQueryParameters(
          {'signature': createSignature(queryString: uri.query, apiSecret: credentials.apiSecret)},
        );
      }

      Response? response;
      switch (method) {
        case 'GET':
          response = await dio.getUri(uri);
          break;

        case 'POST':
          response = await dio.postUri(
            uri,
            data: data ?? {},
          );
          break;

        case 'PUT':
          response = await dio.putUri(uri);
          break;

        case 'DELETE':
          response = await dio.deleteUri(uri);
          break;

        default:
          throw BinanceApiArgumentException('`method` is not set', 1020);
      }

      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        throw BinanceApiResponseException.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 400) {
          throw BinanceApiResponseException.fromJson(e.response?.data);
        }
      } else if (e is BinanceApiResponseException) {
        throw BinanceApiResponseException(e.message, e.code);
      } else {
        throw BinanceApiBaseException('Unknown exception.', -10000);
      }
      rethrow;
    }
  }
}
