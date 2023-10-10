import 'package:epaymment/constants/colors.dart';
import 'package:epaymment/screens/dashboard/home/home_dashboard.dart';
import 'package:epaymment/screens/dashboard/my_cards/my_cards.dart';
import 'package:epaymment/screens/dashboard/user_profile/user_profile_home_screen.dart/home_profile.dart';
import 'package:epaymment/screens/home/first_home_slide_navigation.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  const AppShell({Key? key}) : super(key: key);

  @override
  AppShellState createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeDashboard(),
    const MyCards(),
    const HomeDashboard(),
    const HomeSlideScreen(),
    const ProfileHeader(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: CustomColors.elevatedButtons,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.credit_card_outlined),
            icon: Icon(Icons.credit_card_outlined),
            label: 'My Card',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.qr_code_scanner_outlined),
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.add_chart_sharp),
            icon: Icon(Icons.add_chart_sharp),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person_2_outlined),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }
}
