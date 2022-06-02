import 'package:dio/dio.dart';
import 'package:tic_tac_toe_bridge/contexts/context.dart';

class Controller {
  final Context context;

  const Controller.of(this.context);
}
