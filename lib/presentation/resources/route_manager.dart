import 'package:flutter/material.dart';
import 'package:sportwin_predictor/presentation/game_over/game_over_view.dart';
import 'package:sportwin_predictor/presentation/lose/lose_view.dart';
import 'package:sportwin_predictor/presentation/play/play_view.dart';
import 'package:sportwin_predictor/presentation/resources/string_manager.dart';
import 'package:sportwin_predictor/presentation/round_one/round_one_view.dart';
import 'package:sportwin_predictor/presentation/win/win_view.dart';

class Routes {
  static const String playRoute = "/";
  static const String roundOneRoute = "/roundOne";
  static const String winRoute = "/win";
  static const String loseRoute = "/lose";
  static const String gameOverRoute = "/gameOver";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.playRoute:
        return MaterialPageRoute(builder: (_) => const PlayScreen());
      case Routes.roundOneRoute:
        return MaterialPageRoute(builder: (_) => const RoundOneScreen());

      case Routes.winRoute:
        return MaterialPageRoute(builder: (_) => const WinScreen());
      case Routes.loseRoute:
        return MaterialPageRoute(builder: (_) => const LoseScreen());
      case Routes.gameOverRoute:
        return MaterialPageRoute(builder: (_) => const GameOverScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.noRouteFound),
        ),
        body: Center(child: Text(AppStrings.noRouteFound)),
      ),
    );
  }
}
