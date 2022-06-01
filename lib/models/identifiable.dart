import 'package:tic_tac_toe_bridge/models/identifier.dart';

class Identifiable<T> {
  final Identifier identifier;

  final T information;

  const Identifiable({
    required this.identifier,
    required this.information,
  });

  factory Identifiable.json(
    dynamic json,
    T Function(dynamic json) information,
  ) =>
      Identifiable(
        identifier: Identifier.parse(json['identifier'] as String),
        information: information(json['information'] as Map<String, dynamic>),
      );

  toJson(dynamic Function(T information) information) => {
        'identifier': identifier.toString(),
        'information': information(this.information),
      };

  @override
  String toString() =>
      toJson((information) => information.toString()).toString();
}
