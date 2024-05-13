import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/features/crew/ui/crew_screen.dart';

import '../../../core/themes/colors_manager.dart';
import '../../profile/ui/profile_screen.dart';
import '../../space/ui/space_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screens = const [
    Space(),
    CrewScreen(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: ColorsManager.white,
        useLegacyColorScheme: false,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label: "Space",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_rounded),
            label: "Crew",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_3_rounded),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
