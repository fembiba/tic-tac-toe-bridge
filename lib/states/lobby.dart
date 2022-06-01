import 'package:tic_tac_toe_bridge/models/game.dart';
import 'package:tic_tac_toe_bridge/models/identifier.dart';

abstract class LobbyState {
  const LobbyState();

  factory LobbyState.json(dynamic json) {
    var type = (json['type'] as String).toLowerCase();
    var state = json['state'];

    switch (type) {
      case 'prepare':
        return LobbyPreparingState.json(state);
      case 'playing':
        return LobbyPlayingState.json(state);
      case 'finished':
        return LobbyFinishedState.json(state);
      case 'canceled':
        return LobbyCanceledState.json(state);
      default:
        throw FormatException(type);
    }
  }

  static dynamic toJson(LobbyState state) {
    dynamic stateD = state;

    return stateD.toJson();
  }
}

abstract class LobbyEndedState extends LobbyState {
  const LobbyEndedState();
}

class LobbyPreparingState extends LobbyState {
  const LobbyPreparingState();

  factory LobbyPreparingState.json(dynamic json) {
    return LobbyPreparingState();
  }

  Map<String, dynamic> toJson() => {
        'type': 'prepare',
      };
}

class LobbyPlayingState extends LobbyState {
  final List<Game> games;

  const LobbyPlayingState({
    required this.games,
  });

  factory LobbyPlayingState.json(dynamic json) {
    return LobbyPlayingState(
      games: (json['games'] as List<dynamic>).map((e) => Game.json(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'type': 'playing',
        'state': {
          'games': games.map((e) => e.toString()).toList(),
        },
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      other is LobbyPlayingState && other.games == games;

  @override
  int get hashCode => games.hashCode;
}

class LobbyFinishedState extends LobbyEndedState {
  final List<Identifier> winners;

  const LobbyFinishedState({
    required this.winners,
  });

  factory LobbyFinishedState.json(dynamic json) {
    return LobbyFinishedState(
      winners: (json['winners'] as List<dynamic>)
          .map((e) => Identifier(e as String))
          .toList(),
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
      other is LobbyFinishedState && other.winners == winners;

  @override
  int get hashCode => winners.hashCode;
}

class LobbyCanceledState extends LobbyEndedState {
  final List<Identifier> guilties;

  const LobbyCanceledState({
    required this.guilties,
  });

  factory LobbyCanceledState.json(dynamic json) {
    return LobbyCanceledState(
      guilties: (json['guilties'] as List<dynamic>)
          .map((e) => Identifier(e as String))
          .toList(),
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
      other is LobbyCanceledState && other.guilties == guilties;

  @override
  int get hashCode => guilties.hashCode;
}
