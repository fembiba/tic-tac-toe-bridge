class Position {
  final int horizontal;

  final int vertical;

  const Position.only({this.horizontal = 0, this.vertical = 0})
      : assert(horizontal >= 0),
        assert(vertical >= 0);

  const Position.all([int all = 0])
      : horizontal = all,
        vertical = all,
        assert(all >= 0);

  Position copyWith({
    int? horizontal,
    int? vertical,
  }) {
    return Position.only(
      vertical: vertical ?? this.vertical,
      horizontal: horizontal ?? this.horizontal,
    );
  }
}
