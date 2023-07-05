import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../domain/usecases/auth/refresh_tokens.dart';
import '../domain/usecases/usecase.dart';

class AccessInterceptor extends Interceptor {
  final Dio dio;
  final RefreshTokens refreshTokens;
  final FlutterSecureStorage storage;
  const AccessInterceptor(
      {required this.dio, required this.refreshTokens, required this.storage});

  static const List<String> _denyRefreshPaths = [
    '/auth/login',
    '/auth/refresh-tokens'
  ];

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == '/auth/refresh-tokens') {
      final refreshToken = await storage.read(key: 'refreshToken');
      options.headers['Authorization'] = 'Bearer $refreshToken';
    } else {
      final accessToken = await storage.read(key: 'accessToken');
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final response = err.response;
      if (response != null) {
        final statusCode = response.statusCode;
        if (statusCode == 401 && _validatePath(response.requestOptions.path)) {
          if (await storage.containsKey(key: 'refreshToken')) {
            final res = await refreshTokens.call(NoParams());
            if (res.isRight()) {
              return handler.resolve(await _retry(err.requestOptions));
            }
          }
        }
        return handler.next(err);
      }
      return handler.next(err);
    } on DioException catch (e) {
      return handler.next(e);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  bool _validatePath(String path) {
    for (String denyPath in _denyRefreshPaths) {
      if (path == denyPath) return false;
    }
    return true;
  }
}

class LoggerInterceptor extends Interceptor {
  const LoggerInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final url = '${options.baseUrl}${options.path}';
    print(
        'Request send to $url Headers: ${options.headers} Data: ${options.data} QueryParameters: ${options.queryParameters}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'Response status code: ${response.statusCode}; Data: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(
        'Error: ${err.error} Message: ${err.message} StackTrace: ${err.stackTrace}.');
    return handler.next(err);
  }
}

class AwaitInterceptor extends Interceptor {
  const AwaitInterceptor();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    return handler.next(options);
  }
}
