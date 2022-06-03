import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/base.dart';
import 'package:tic_tac_toe_bridge/exceptions/interval.dart';
import 'package:tic_tac_toe_bridge/factories/base.dart';

class IntervalExceptionFactory extends ExceptionFactory {
  const IntervalExceptionFactory();

  @override
  bool match(DioError error) =>
      error.response?.data['type'] is String &&
      error.response?.data['type'] == 'Interval';

  @override
  TicTacToeException transform(DioError error) {
    return IntervalTicTacToeException(
        (error.response?.data['message'] as String?) ?? 'Timeline is out.');
  }
}
