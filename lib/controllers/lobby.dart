import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/enums/game_mode.dart';
import 'package:tic_tac_toe_bridge/models/lobby.dart';

class LobbyController extends Controller {
  const LobbyController.of(super.context) : super.of();

  @auth
  Future<Lobby> read({bool wait = false}) async {
    var result = await context.httpClient.get('/lobby', queryParameters: {
      'polling': wait,
    });

    return Lobby.json(result.data);
  }

  @auth
  Future<Lobby> search(String gameMode, {bool wait = true}) async {
    var result = await context.httpClient.post('/lobby/search', data: {
      'polling': wait,
    });

    return Lobby.json(result.data);
  }

  @auth
  Future leave() async {
    await context.httpClient.get('/lobby/leave');
  }
}
