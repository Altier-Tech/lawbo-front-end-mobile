import 'package:flutter/material.dart';
import 'package:lawbo/custom-widgets/custom_drawer.dart';

import '../bottom nav bar pages/help_page.dart';
import '../bottom nav bar pages/home_page.dart';
import '../bottom nav bar pages/profile_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomePage(),
      const HelpPage(),
      const ProfilePage(),
    ];
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey.shade300,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.grey.shade900,
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ]),
        drawer: CustomDrawer(size: size),
        //body
        body: screens[currentIndex],
      ),
    );
  }
}
