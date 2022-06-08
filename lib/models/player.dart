class Player {
  final String name;

  final int level;

  final int experience;

  const Player({
    required this.name,
    this.level = 0,
    this.experience = 0,
  });

  factory Player.json(dynamic json) {
    return Player(
      name: json['name'] as String,
      level: json['level'] as int,
      experience: json['experience'] as int,
    );
  }

  dynamic toJson() => {
        'name': name,
        'level': level,
        'experience': experience,
      };

  @override
  String toString() => toJson().toString();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Player &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          level == other.level &&
          experience == other.experience;

  @override
  int get hashCode => name.hashCode ^ level.hashCode ^ experience.hashCode;
}
