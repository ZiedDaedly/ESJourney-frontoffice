import 'package:esjourney/data/models/curriculum/course_model.dart';
import 'package:esjourney/presentation/screens/curriculum/avatar/avatar_screen.dart';
import 'package:esjourney/presentation/screens/curriculum/chat/chat_users_screen.dart';
import 'package:esjourney/presentation/screens/curriculum/courses/course_detail_screen.dart';
import 'package:esjourney/presentation/screens/curriculum/courses/level_map_screen.dart';
import 'package:esjourney/presentation/screens/curriculum/games/jackpot/jackpot_screen.dart';
import 'package:esjourney/presentation/screens/curriculum/games/worldy/screens/wordly_game.dart';
import 'package:esjourney/presentation/screens/sign_in_screen.dart';
import 'package:esjourney/presentation/screens/sign_up_screen.dart';
import 'package:esjourney/presentation/screens/zoom_drawer_screen.dart';
import 'package:flutter/material.dart';
import 'routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => SignInScreen(),
        );

      case AppRoutes.avatar:
        return MaterialPageRoute(
          builder: (_) => AvatarScreen(),
        );

      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(),
        );

      case AppRoutes.zoomDrawerScreen:
        return MaterialPageRoute(
          builder: (_) => const ZoomDrawerScreen(),
        );

      case AppRoutes.courseDetails:
        return MaterialPageRoute(
          builder: (_) => CourseDetailScreen(
            course: args as Course,
          ),
        );

      case AppRoutes.jackpotGame:
        return MaterialPageRoute(builder: (_) => const JackpotScreen());

      case AppRoutes.wordlyGame:
        return MaterialPageRoute(builder: (_) => const WordlyPage());

      case AppRoutes.chatUsers:
        return MaterialPageRoute(builder: (_) => const UserChatScreen());

      case AppRoutes.levelMap:
        return MaterialPageRoute(
          builder: (_) => LevelMapScreen(
            grade: args as int,
          ),
        );

      default:
        return null;
    }
  }
}
