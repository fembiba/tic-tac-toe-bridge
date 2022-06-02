import 'package:tic_tac_toe_bridge/models/identifiable.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class Auth {
  final String token;

  final Identifiable<Player> player;

  const Auth({required this.token, required this.player});

  factory Auth.json(dynamic json) => Auth(
        token: json['token'] as String,
        player: Identifiable<Player>.json(
          json['player'],
          (json) => Player.json(json),
        ),
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'player': player.toJson((information) => information.toJson()),
      };

  @override
  String toString() => toJson().toString();
}
