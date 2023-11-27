import 'package:flutter/material.dart';
import '../screens/bookmark_screen.dart';
import '../screens/main_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    const MainScreen(),
    const BookmarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.deepPurple.withOpacity(0.4),
          selectedItemColor: Colors.deepPurple,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_rounded,),
              label: 'Bookmarks',
            ),
          ]),
    );
  }
}