import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/exceptions/base.dart';
import 'package:tic_tac_toe_bridge/exceptions/validation.dart';
import 'package:tic_tac_toe_bridge/factories/base.dart';

class ValidationExceptionFactory extends ExceptionFactory {
  const ValidationExceptionFactory();

  @override
  bool match(DioError error) => error.response?.data['type'] == 'Validation';

  @override
  TicTacToeException transform(DioError error) {
    return ValidationTicTacToeException(
        (error.response?.data['message'] as String?) ??
            'Can\'t validate method data.');
  }
}
