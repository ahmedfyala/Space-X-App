import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    //TODO  width and height in designSize
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppStrings.appName,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.transparent,
            ),
          ),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.homeScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
