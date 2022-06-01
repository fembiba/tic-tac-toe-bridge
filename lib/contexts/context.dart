import 'package:dio/dio.dart';

typedef ContextSecretProvider = String Function(String token);

class Context {
  final Dio _client;

  String? _token;

  ContextSecretProvider _secret;

  Object get client => _client;

  bool get isAuth => _token != null;

  Context(JsonDecodeCallback decoder, ContextSecretProvider secret)
      : _secret = secret,
        _client = Dio() {
    _client.interceptors
        .add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
      if (isAuth) {
        options.headers["Authorization"] = "Bearer $_token-${_secret(_token!)}";
      }
    }));

    _client.transformer = DefaultTransformer(jsonDecodeCallback: decoder);
  }

  void auth(String token) {
    _token = token;
  }

  void unauth() {
    _token = null;
  }
}
