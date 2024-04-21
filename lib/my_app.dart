import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/themes/theme_manager.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context,widget){
        return MaterialApp(
          title: AppStrings.appName,
          theme: getApplicationTheme(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.welcome,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
