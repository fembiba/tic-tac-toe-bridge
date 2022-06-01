import 'package:tic_tac_toe_bridge/models/identifiable.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class Auth {
  final String token;

  final Identifiable<Player> player;

  const Auth(this.token, {required this.player});
}
