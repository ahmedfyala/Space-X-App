import 'package:flutter/material.dart';

import '../../widgets/welcome_screen_body.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: WelcomeScreenBody(),
      ),
    );
  }
}
