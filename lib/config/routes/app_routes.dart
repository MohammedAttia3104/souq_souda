import 'package:flutter/material.dart';

abstract class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RouteName.loginScreen:
      //   return MaterialPageRoute(builder: (context) => ,)
      // case charactersDetailsScreen:
      //   final character = settings.arguments as Character;
      //   return MaterialPageRoute(
      //     builder: (_) => CharacterDetailsScreen(
      //       character: character,
      //     ),
      //   );
    }
    return null;
  }
}
