import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/extensions/handle_response.dart';
import 'package:tic_tac_toe_bridge/models/game.dart';
import 'package:tic_tac_toe_bridge/models/move.dart';
import 'package:tic_tac_toe_bridge/models/position.dart';

class GameController extends Controller {
  const GameController.of(super.context) : super.of();

  @auth
  Future<Game> read({bool wait = false}) async {
    var result = await context.httpClient.get('/game', queryParameters: {
      'polling': wait,
    }).handle(context);

    return Game.json(result.data);
  }

  @auth
  Future<Move> move(Position position) async {
    var result = await context.httpClient.post('/game/move', data: {
      'position': position.toJson(),
    }).handle(context);

    return Move.json(result.data);
  }
}
