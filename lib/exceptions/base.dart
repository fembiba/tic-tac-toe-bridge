class TicTacToeException implements Exception {
  final String message;

  const TicTacToeException(this.message);

  @override
  String toString() => "TicTacToeException: $message";
}
