import 'package:tic_tac_toe_bridge/annotations/auth.dart';
import 'package:tic_tac_toe_bridge/controllers/base.dart';
import 'package:tic_tac_toe_bridge/models/auth.dart';
import 'package:tic_tac_toe_bridge/models/identifiable.dart';
import 'package:tic_tac_toe_bridge/models/player.dart';

class AuthController extends Controller {
  const AuthController.of(super.context) : super.of();

  Future<Auth> signIn(String name, String password) async {
    throw UnimplementedError();
  }

  Future<Identifiable<Player>> signUp(String name, String password) async {
    throw UnimplementedError();
  }

  @auth
  Future<Identifiable<Player>> signOut() async {
    throw UnimplementedError();
  }
}
