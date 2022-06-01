import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/exceptions.dart';
import 'package:tic_tac_toe_bridge/factories/factories.dart';

class ExceptionService {
  final Set<ExceptionFactory> _factories = {};

  final ExceptionFactory _factory;

  ExceptionService(ExceptionFactory factory) : _factory = factory;

  void register(ExceptionFactory factory) => _factories.add(factory);

  void unregister(ExceptionFactory factory) => _factories.remove(factory);

  TicTacToeException find(DioError error) {
    return _factories
        .firstWhere(
          (factory) => factory.match(error),
          orElse: () => _factory,
        )
        .transform(error);
  }
}
