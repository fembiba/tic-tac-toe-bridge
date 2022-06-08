import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/extensions/handle_response.dart';
import 'package:tic_tac_toe_bridge/models/lobby.dart';
import 'package:tic_tac_toe_bridge/models/polling.dart';
import 'package:tic_tac_toe_bridge/models/waiter.dart';

class LobbyController extends Controller {
  const LobbyController.of(super.context) : super.of();

  @auth
  Future<Waitable<Lobby>> read([Waiter? waiter]) async {
    var result = await context.httpClient.get('/lobby', queryParameters: {
      'polling': waiter?.toString(),
    }).handle(context);

    return Waitable.json(result.data, (json) => Lobby.json(result.data));
  }

  @auth
  Future<Waitable<Lobby>> search(String gameMode, [Waiter? waiter]) async {
    var result = await context.httpClient.post('/lobby/search', data: {
      'polling': waiter?.toString(),
      'mode': gameMode,
    }).handle(context);

    return Waitable.json(result.data, (json) => Lobby.json(result.data));
  }

  @auth
  Future<void> leave() async {
    await context.httpClient.get('/lobby/leave').handle(context);
  }
}
