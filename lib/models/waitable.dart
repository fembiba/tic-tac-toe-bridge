import 'package:tic_tac_toe_bridge/models/waiter.dart';

class Waitable<T> {
  final Waiter waiter;
  final T information;

  const Waitable({
    required this.waiter,
    required this.information,
  });

  factory Waitable.json(
    dynamic json,
    T Function(dynamic json) information,
  ) =>
      Waitable(
        waiter: Waiter.parse(json['polling'] as String?),
        information: information(json['information'] as dynamic),
      );

  dynamic toJson(dynamic Function(T information) information) => {
        'polling': waiter.toString(),
        'information': information(this.information),
      };

  @override
  String toString() =>
      toJson((information) => information.toString()).toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Waitable &&
          runtimeType == other.runtimeType &&
          waiter == other.waiter &&
          information == other.information;

  @override
  int get hashCode => waiter.hashCode ^ information.hashCode;
}
