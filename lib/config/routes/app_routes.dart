import 'package:flutter/material.dart';
import 'package:souq_souda/article/presentation/screens/all_notification_screen.dart';
import 'package:souq_souda/article/presentation/screens/article_details_screen.dart';
import 'package:souq_souda/config/routes/routes_name.dart';

abstract class AppRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.notifications:
        return MaterialPageRoute(
          builder: (context) => const AllNotificationScreen(),
        );
      case RouteName.articleDetails:
        return MaterialPageRoute(
          builder: (context) => const ArticleDetailsScreen(),
          // settings:
        );
    }
    // case charactersDetailsScreen:
    //   final character = settings.arguments as Character;
    //   return MaterialPageRoute(
    //     builder: (_) => CharacterDetailsScreen(
    //       character: character,
    //     ),
    //   );
    return null;
  }
}
