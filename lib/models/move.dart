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

  Map<String, dynamic> toJson() => {
        'isMoved': moved,
        'game': game.toJson(),
      };
}
