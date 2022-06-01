import 'package:tic_tac_toe_bridge/models/Identifier.dart';
import 'package:tic_tac_toe_bridge/models/board.dart';

abstract class GameState {
  const GameState();
}

class GamePreparingState extends GameState {
  const GamePreparingState();
}

class GamePlayingState extends GameState {
  final Board board;

  final List<Identifier> walkers;

  final DateTime? next;

  const GamePlayingState({
    required this.board,
    required this.walkers,
    this.next,
  });
}

class GameFinishedState extends GameState {
  final List<Identifier> winners;

  const GameFinishedState({
    required this.winners,
  });
}

class GameCanceledState extends GameState {
  final List<Identifier> guilties;

  const GameCanceledState({
    required this.guilties,
  });
}
