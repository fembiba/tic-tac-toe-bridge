import 'package:tic_tac_toe_bridge/models/identifier.dart';

class Board {
  final List<List<Identifier?>> cells;

  bool get fulled => throw UnimplementedError();

  const Board(this.cells);

  factory Board.json(dynamic json) => Board(
        (json as List<dynamic>)
            .map(
              (e) => (e as List<dynamic>)
                  .map((e) => e != null ? Identifier(e as String) : null)
                  .toList(),
            )
            .toList(),
      );

  List<List<dynamic>> toJson() =>
      cells.map((e) => e.map((e) => e?.toString()).toList()).toList();

  @override
  String toString() => toJson().toString();
}
