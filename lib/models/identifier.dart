class Identifier {
  static final RegExp _validate =
      RegExp("^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}\$");

  final String _value;

  const Identifier(String value) : _value = value;

  static Identifier parse(String value) {
    assert(_validate.hasMatch(value));

    return Identifier(value);
  }

  @override
  String toString() {
    return _value;
  }

  @override
  bool operator ==(Object other) =>
      other is Identifier && _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
