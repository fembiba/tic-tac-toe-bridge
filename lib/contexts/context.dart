import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/tic_tac_toe_bridge.dart';

typedef SecretProviderCallback = String Function();

class Context {
  String? _token;

  final Dio httpClient;

  final ExceptionService exceptionService;

  final String authority;

  final SecretProviderCallback secretProvider;

  final JsonDecodeCallback jsonProvider;

  String? get token => _token;

  bool get authorized => _token != null;

  Context.build({
    this.authority = 'api.ttt.flx.team',
    JsonDecodeCallback? jsonProvider,
    SecretProviderCallback? secretProvider,
  })  : exceptionService = ExceptionService(InternalExceptionFactory()),
        httpClient = Dio(),
        jsonProvider = jsonProvider ?? defaultJsonProviderBuilder(),
        secretProvider = secretProvider ?? defaultSecretProviderBuilder() {
    _initBaseUrl();
    _initTransformer();
    _initAuthInterceptor();
    _initExceptionFactories();
  }

  void _initExceptionFactories() {
    exceptionService.register(IntervalExceptionFactory());
    exceptionService.register(ValidationExceptionFactory());
    exceptionService.register(AccessExceptionFactory());
    exceptionService.register(DefaultExceptionFactory());
  }

  void _initAuthInterceptor() {
    httpClient.interceptors.add(LogInterceptor(responseBody: true));
    httpClient.interceptors.add(QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        if (authorized) {
          options.headers['Authorization'] =
              'Bearer $_token-${secretProvider()}';
        }

        print(options.headers);

        handler.next(options);
      },
    ));
  }

  void _initBaseUrl() {
    httpClient.options.baseUrl = 'https://$authority';
  }

  void _initTransformer() {
    httpClient.transformer =
        DefaultTransformer(jsonDecodeCallback: jsonProvider);
  }

  static JsonDecodeCallback defaultJsonProviderBuilder() {
    return (text) => jsonDecode(text);
  }

  static SecretProviderCallback defaultSecretProviderBuilder() {
    return () => md5.convert(utf8.encode("empty")).toString().substring(0, 12);
  }

  void auth(String token) {
    _token = token;
  }

  void unauth() {
    _token = null;
  }
}
