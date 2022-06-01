import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/base.dart';

abstract class ExceptionFactory {
  const ExceptionFactory();

  bool match(DioError error);

  TicTacToeException transform(DioError error);
}
