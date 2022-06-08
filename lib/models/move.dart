import 'package:tic_tac_toe_bridge/models/game.dart';

class Move {
  final bool moved;

  final Game game;

  const Move({
    required this.moved,
    required this.game,
  });

  factory Move.json(dynamic json) => Move(
        moved: json['isMoved'] as bool,
        game: Game.json(json['game']),
      );

  @override
  String toString() => toJson().toString();

  dynamic toJson() => {
        'isMoved': moved,
        'game': game.toJson(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Move &&
          runtimeType == other.runtimeType &&
          moved == other.moved &&
          game == other.game;

  @override
  int get hashCode => moved.hashCode ^ game.hashCode;
}
