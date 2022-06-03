import 'package:tic_tac_toe_bridge/models/identifier.dart';
import 'package:tic_tac_toe_bridge/models/board.dart';

abstract class GameState {
  const GameState();

  factory GameState.json(dynamic json) {
    var type = (json['type'] as String).toLowerCase();
    var state = json['information'];

    switch (type) {
      case 'prepare':
        return GamePreparingState.json(state);
      case 'playing':
        return GamePlayingState.json(state);
      case 'finished':
        return GameFinishedState.json(state);
      case 'canceled':
        return GameCanceledState.json(state);
      default:
        throw FormatException(type);
    }
  }

  static dynamic toJson(GameState state) {
    dynamic stateD = state;

    return stateD.toJson();
  }
}

abstract class GameEndedState extends GameState {
  const GameEndedState();
}

class GamePreparingState extends GameState {
  const GamePreparingState();

  factory GamePreparingState.json(dynamic json) {
    return GamePreparingState();
  }

  Map<String, dynamic> toJson() => {
        'type': 'prepare',
      };
}

class GamePlayingState extends GameState {
  final Board board;

  final Set<Identifier> walkers;

  final DateTime? next;

  const GamePlayingState({
    required this.board,
    required this.walkers,
    this.next,
  });

  factory GamePlayingState.json(dynamic json) {
    return GamePlayingState(
      board: Board.json(json['board']),
      walkers: (json['walkers'] as List<dynamic>)
          .map((e) => Identifier(e as String))
          .toSet(),
      next: json['next'] != null ? DateTime.parse(json['next']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        'type': 'playing',
        'state': {
          'winners': walkers.map((e) => e.toString()).toList(),
        },
        'next': next?.toIso8601String(),
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      other is GamePlayingState &&
      other.walkers == walkers &&
      other.board == board;

  @override
  int get hashCode => Object.hash(walkers, next, board);
}

class GameFinishedState extends GameEndedState {
  final Set<Identifier> winners;

  const GameFinishedState({
    required this.winners,
  });

  factory GameFinishedState.json(dynamic json) {
    return GameFinishedState(
      winners: (json['winners'] as List<dynamic>)
          .map((e) => Identifier(e as String))
          .toSet(),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': 'finished',
        'state': {
          'winners': winners.map((e) => e.toString()).toList(),
        },
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      other is GameFinishedState && other.winners == winners;

  @override
  int get hashCode => winners.hashCode;
}

class GameCanceledState extends GameEndedState {
  final Set<Identifier> guilties;

  const GameCanceledState({
    required this.guilties,
  });

  factory GameCanceledState.json(dynamic json) {
    return GameCanceledState(
      guilties: (json['guilties'] as List<dynamic>)
          .map((e) => Identifier(e as String))
          .toSet(),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': 'canceled',
        'state': {
          'guilties': guilties.map((e) => e.toString()).toList(),
        },
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      other is GameCanceledState && other.guilties == guilties;

  @override
  int get hashCode => guilties.hashCode;
}
