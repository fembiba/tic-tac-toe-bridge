import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class PlayerController extends Controller {
  const PlayerController.of(super.context) : super.of();

  @auth
  Player information() {
    throw UnimplementedError();
  }
}
