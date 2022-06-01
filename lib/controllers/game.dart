import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/game.dart';
import 'package:tic_tac_toe_bridge/models/position.dart';

class GameController extends Controller {
  const GameController.of(super.context) : super.of();

  @auth
  Future<Game> read({bool wait = false}) async {
    var result = await context.httpClient.get('/game', queryParameters: {
      'polling': wait,
    });

    return Game.json(result.data);
  }

  @auth
  Future<Game> move(Position position) async {
    var result = await context.httpClient.post('/game/move', data: {
      'position': {
        'horizontal': position.horizontal,
        'vertical': position.vertical,
      },
    });

    return Game.json(result.data);
  }
}
