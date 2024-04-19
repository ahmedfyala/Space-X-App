import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/features/profile/ui/profile_screen.dart';
import 'package:flutter_mentorship_b1/features/search/ui/search_screen.dart';
import 'package:flutter_mentorship_b1/features/ships/logic/cubit.dart';
import 'package:flutter_mentorship_b1/features/ships/ui/screens/ships_screen.dart';

import '../../features/home/ui/home_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.searchScreen:
        return MaterialPageRoute(
          builder: (_) => const Search(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const Profile(),
        );
      case Routes.ships:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<ShipCubit>()..getAllShips(),
            child: const ShipsScreen(),
          ),
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
