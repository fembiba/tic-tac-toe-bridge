class Waiter {
  final dynamic _value;

  const Waiter(dynamic value) : _value = value;

  factory Waiter.parse(dynamic value) {
    return Waiter(value);
  }

  @override
  String toString() => _value.toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Waiter &&
          runtimeType == other.runtimeType &&
          _value == other._value;

  @override
  int get hashCode => _value.hashCode;
}
