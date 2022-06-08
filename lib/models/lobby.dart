import 'package:tic_tac_toe_bridge/tic_tac_toe_bridge.dart';

class Lobby {
  final LobbyState state;

  final Set<Identifier> players;

  const Lobby({
    required this.state,
    required this.players,
  });

  factory Lobby.json(dynamic json) => Lobby(
        state: LobbyState.json(json['state']),
        players: (json['players'] as List<dynamic>)
            .map((e) => Identifier(e as String))
            .toSet(),
      );

  @override
  String toString() => toJson().toString();

  dynamic toJson() => {
        'state': (state as dynamic).toJson(),
        'players': players.map((e) => e.toString()).toList(),
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Lobby &&
          runtimeType == other.runtimeType &&
          state == other.state &&
          players == other.players;

  @override
  int get hashCode => state.hashCode ^ players.hashCode;
}
