import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/base.dart';
import 'package:tic_tac_toe_bridge/factories/base.dart';

class DefaultExceptionFactory extends ExceptionFactory {
  const DefaultExceptionFactory();

  @override
  bool match(DioError error) => error.response?.data['type'] == 'Default';

  @override
  TicTacToeException transform(DioError error) {
    return TicTacToeException((error.response?.data['message'] as String?) ??
        'Unreadable exception text.');
  }
}
