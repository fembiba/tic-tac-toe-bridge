import 'package:tic_tac_toe_bridge/contexts/context.dart';

class Controller {
  final Context context;

  Object get client => context.client;

  const Controller.of(this.context);
}
