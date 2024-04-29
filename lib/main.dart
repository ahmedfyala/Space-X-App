import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mentorship_b1/core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/routing/app_router.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}
