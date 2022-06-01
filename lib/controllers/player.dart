import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/identifier.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class PlayerController extends Controller {
  const PlayerController.of(super.context) : super.of();

  @auth
  Future<Player> read([Identifier? player]) async {
    var result =
        await context.httpClient.get('/player/${player?.toString() ?? ''}');

    return Player.json(result.data);
  }
}
