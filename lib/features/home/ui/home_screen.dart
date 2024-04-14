import 'package:flutter/material.dart';

import '../../../core/themes/colors_manager.dart';
import '../../profile/ui/profile_screen.dart';
import '../../search/ui/search_screen.dart';
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
    Search(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorsManager.black,
      body: screens[selectedIndex]??SizedBox(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch),
            label:"Space",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_outlined),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
