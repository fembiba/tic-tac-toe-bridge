import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/contexts/context.dart';

extension HandleResponseExtension on Future<Response<dynamic>> {
  Future<Response<dynamic>> handle(Context context) async {
    try {
      return await this;
    } on DioError catch (error) {
      throw context.exceptionService.find(error);
    }
  }
}
