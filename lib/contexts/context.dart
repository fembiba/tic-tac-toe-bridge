import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/utils/secret.dart';

class Context {
  final Dio _client;

  String? _token;

  Object get client => _client;

  bool get isAuth => _token != null;

  Context() : _client = Dio() {
    _client.interceptors
      ..add(QueuedInterceptorsWrapper(onRequest: (options, handler) {
        if (isAuth) {
          options.headers["Authorization"] =
              "Bearer $_token-${SecretUtils.generate(_token!)}";
        }
      }));
  }

  void auth(String token) {
    _token = token;
  }

  void unauth() {
    _token = null;
  }
}
