import 'package:tic_tac_toe_bridge/models/identifier.dart';
import 'package:tic_tac_toe_bridge/states/game.dart';

class Game {
  final GameState state;

  final List<Identifier> players;

  const Game({
    required this.state,
    required this.players,
  });
}
