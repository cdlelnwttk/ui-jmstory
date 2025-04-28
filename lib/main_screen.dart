import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'main.dart';
import 'new_page.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    MainScreen(),
    NewPage(initialTabIndex: 0),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Switches screen automatically
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
