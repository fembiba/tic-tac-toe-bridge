import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/enums/game_mode.dart';
import 'package:tic_tac_toe_bridge/models/lobby.dart';

class LobbyController extends Controller {
  const LobbyController.of(super.context) : super.of();

  @auth
  Future<Lobby> information({bool polling = false}) {
    throw UnimplementedError();
  }

  @auth
  Future<Lobby> search(GameMode gameMode, {bool polling = true}) {
    throw UnimplementedError();
  }

  @auth
  Future leave() {
    throw UnimplementedError();
  }
}
