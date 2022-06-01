import 'package:tic_tac_toe_bridge/exceptions/base.dart';
import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/server.dart';
import 'package:tic_tac_toe_bridge/factories/base.dart';

class InternalExceptionFactory extends ExceptionFactory {
  const InternalExceptionFactory();

  @override
  bool match(DioError error) => (error.response?.statusCode ?? 0) >= 500;

  @override
  TicTacToeException transform(DioError error) {
    return ServerTicTacToeException('Error on server side.');
  }
}
