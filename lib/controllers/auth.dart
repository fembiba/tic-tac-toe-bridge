import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/auth.dart';
import 'package:tic_tac_toe_bridge/models/identifiable.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class AuthController extends Controller {
  const AuthController.of(super.context) : super.of();

  Future<Auth> signIn(String name, String password) async {
    var result = await context.httpClient.post('/sign/in', data: {
      'name': name,
      'password': password,
      'secret': context.secretProvider(name),
    });

    var auth = Auth.json(result.data);

    context.auth(auth.token);

    return auth;
  }

  Future<Identifiable<Player>> signUp(String name, String password) async {
    var result = await context.httpClient.post('/sign/up', data: {
      'name': name,
      'password': password,
    });

    return Identifiable<Player>.json(result.data, (json) => Player.json(json));
  }

  @auth
  Future signOut() async {
    await context.httpClient.post('/sign/out');

    context.unauth();
  }
}
