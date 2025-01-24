import 'package:flutter/material.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_colors.dart';
import 'package:vikncodes_machine_test/core/themes/vikn_images.dart';
import 'package:vikncodes_machine_test/ui/dashboard_screen/presentation/dashboard_screen.dart';
import 'package:vikncodes_machine_test/ui/profile_screen/presentation/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Create navigation keys for each tab
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  List<Widget> widgetList = [
    DashboardScreen(),
    Center(
      child: Text(
        "Explore Screen",
        style: TextStyle(color: ViknColors.whiteColor,fontSize: 20),
      ),
    ),
    Center(
      child: Text(
        "Notification Screen",
        style: TextStyle(color: ViknColors.whiteColor,fontSize: 20),
      ),
    ),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    if (index == _selectedIndex) {
      _navigatorKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  BottomNavigationBarItem _buildBottomNavItem(String icon) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        color: Colors.grey,
      ),
      activeIcon: Column(
        spacing: 4,
        children: [
          Image.asset(
            icon,
            color: ViknColors.whiteColor,
          ),
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ViknColors.whiteColor,
            ),
          )
        ],
      ),
      label: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: widgetList[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
              offset: Offset(0.0, 0.75),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: ViknColors.whiteColor,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          currentIndex: _selectedIndex,
          elevation: 0,
          iconSize: 28,
          onTap: _onItemTapped,
          items: [
            _buildBottomNavItem(ViknImages.homeIcon),
            _buildBottomNavItem(ViknImages.exploreIcon),
            _buildBottomNavItem(ViknImages.notificationIcon),
            _buildBottomNavItem(ViknImages.profileIcon),
          ],
        ),
      ),
    );
  }
}
