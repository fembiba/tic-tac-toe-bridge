class Size {
  final int width;

  final int height;

  const Size.only({this.width = 0, this.height = 0})
      : assert(width >= 0),
        assert(height >= 0);

  const Size.all([int all = 0])
      : width = all,
        height = all,
        assert(all >= 0);

  Size copyWith({
    int? width,
    int? height,
  }) {
    return Size.only(
      height: height ?? this.height,
      width: width ?? this.width,
    );
  }
}
