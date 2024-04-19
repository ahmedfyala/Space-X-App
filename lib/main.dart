import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/di/dependency_injection.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

await setupGetIt();




  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
