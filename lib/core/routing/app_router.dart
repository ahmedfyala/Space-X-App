import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/profile/ui/profile_screen.dart';
import 'package:flutter_mentorship_b1/features/search/ui/search_screen.dart';

import '../../features/home/ui/home_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.SearchScreen:
        return MaterialPageRoute(
          builder: (_) => const Search(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const Profile(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
