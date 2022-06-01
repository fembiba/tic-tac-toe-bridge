import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/lobby.dart';
import 'package:tic_tac_toe_bridge/models/position.dart';

class GameController extends Controller {
  const GameController.of(super.context) : super.of();

  @auth
  Future<Lobby> information({bool polling = false}) {
    throw UnimplementedError();
  }

  @auth
  Future<Lobby> move(Position position) {
    throw UnimplementedError();
  }
}
