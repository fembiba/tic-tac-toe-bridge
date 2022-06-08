import 'package:tic_tac_toe_bridge/models/identifier.dart';
import 'package:tic_tac_toe_bridge/states/game.dart';

class Game {
  final GameState state;

  final Set<Identifier> players;

  const Game({
    required this.state,
    required this.players,
  });

  factory Game.json(dynamic json) => Game(
        state: GameState.json(json['state']),
        players: (json['players'] as List<dynamic>)
            .map((e) => Identifier(e as String))
            .toSet(),
      );

  dynamic toJson() => {
        'state': GameState.toJson(state),
        'players': players.map((e) => e.toString()).toList(),
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Game &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          players == other.players;

  @override
  int get hashCode => state.hashCode ^ players.hashCode;
}
