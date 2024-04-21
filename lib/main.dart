import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/dependency_injection.dart';
import 'core/routing/app_router.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();
  await ScreenUtil.ensureScreenSize();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
