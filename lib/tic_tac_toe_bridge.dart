// ignore_for_file: iterable_contains_unrelated_type

library tic_tac_toe_bridge;

import 'package:tic_tac_toe_bridge/tic_tac_toe_bridge.dart';

export 'models/models.dart';
export 'states/states.dart';
export 'controllers/controllers.dart';
export 'enums/enums.dart';
export 'contexts/context.dart';
export 'services/services.dart';
export 'factories/factories.dart';
export 'exceptions/exceptions.dart';
export 'annotations/annotations.dart';

void example() async {
  var context = Context.build();

  var auth = await AuthController.of(context).signIn('femba', '12345678');

  await LobbyController.of(context).search(GameMode.classic);

  var game = await GameController.of(context).read(wait: false);

  while (game.state is! GameEndedState) {
    if (game.state is GamePlayingState) {
      if ((game.state as GamePlayingState)
          .walkers
          .contains(auth.player.identifier)) {
        print('your turn');

        game = await GameController.of(context)
            .move(Position.only(horizontal: 3, vertical: 2));
      }
    } else {
      game = await GameController.of(context).read();
    }
  }

  print('game is ended');
}
