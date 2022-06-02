import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/extensions/handle_response.dart';
import 'package:tic_tac_toe_bridge/models/identifiable.dart';
import 'package:tic_tac_toe_bridge/models/identifier.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class PlayerController extends Controller {
  const PlayerController.of(super.context) : super.of();

  @auth
  Future<Identifiable<Player>> read([Identifier? player]) async {
    var result = await context.httpClient
        .get('/player/${player?.toString() ?? ''}')
        .handle(context);

    return Identifiable<Player>.json(result.data, (json) => Player.json(json));
  }
}
