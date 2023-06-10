import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../utils/constant.dart';
import 'documents/document.dart';
import 'home/home.dart';
import 'profil/profile.dart';
import 'listerendez_vous/rendezvous.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int newIndex = 0;

  final screens = [
    const HomeScreen(),
    const RendezvousScreen(),
    const DocumentScreen(),
    const ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[newIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 25,
        unselectedFontSize: 10,
        fixedColor: Colors.cyan,
        backgroundColor: Colors.white,
        selectedFontSize: 10,
        onTap: (index) {
          setState(() {
            newIndex = index;
          });
        },
        currentIndex: newIndex,
        type: BottomNavigationBarType.fixed,
        enableFeedback: true,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(
          color: kPrimaryColor,
        ),
        items: [
          BottomNavigationBarItem(
            activeIcon: const Icon(IconlyBroken.home, color: kPrimaryColor),
            icon: Icon(
              IconlyBroken.home,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.4),
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              activeIcon:
                  const Icon(IconlyBroken.calendar, color: kPrimaryColor),
              icon: Icon(
                IconlyBroken.calendar,
                color: Colors.black,
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(3, 6),
                  ),
                ],
              ),
              label: 'Dates'),
          BottomNavigationBarItem(
            activeIcon: const Icon(IconlyBroken.paper, color: kPrimaryColor),
            icon: Icon(
              IconlyBroken.paper,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            label: 'Document',
          ),
          BottomNavigationBarItem(
            activeIcon: const Icon(IconlyBroken.profile, color: kPrimaryColor),
            icon: Icon(
              IconlyBroken.profile,
              color: Colors.black,
              shadows: [
                Shadow(
                  blurRadius: 10,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(3, 6),
                ),
              ],
            ),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
