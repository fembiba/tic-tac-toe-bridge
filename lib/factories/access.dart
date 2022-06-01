import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/base.dart';
import 'package:tic_tac_toe_bridge/exceptions/access.dart';
import 'package:tic_tac_toe_bridge/factories/factories.dart';

class AccessExceptionFactory extends ExceptionFactory {
  const AccessExceptionFactory();

  @override
  bool match(DioError error) => error.response?.data['type'] == 'Access';

  @override
  TicTacToeException transform(DioError error) {
    return AccessTicTacToeException(
        (error.response?.data['message'] as String?) ??
            'Can\'t acces to the server by this method.');
  }
}
