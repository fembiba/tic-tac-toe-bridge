import 'package:tic_tac_toe_bridge/tic_tac_toe_bridge.dart';

class Identifiable<T> {
  final Identifier identifier;

  final T information;

  const Identifiable({
    required this.identifier,
    required this.information,
  });
}
