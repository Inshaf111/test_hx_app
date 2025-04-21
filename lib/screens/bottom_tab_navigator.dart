import 'package:flutter/material.dart';
import 'package:test_hx_app/config/theme_constants.dart';
import 'package:test_hx_app/screens/home_screen/home_screen.dart';

class BottomTabNavigator extends StatefulWidget {
  const BottomTabNavigator({super.key});

  @override
  State<BottomTabNavigator> createState() => _BottomTabNavigatorState();
}

class _BottomTabNavigatorState extends State<BottomTabNavigator> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(), // ← Chart screen
    const HomeScreen(),
    const HomeScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: primaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'Assets & Liabilities'),
          BottomNavigationBarItem(
              icon: Icon(Icons.graphic_eq_outlined), label: 'WelathFlow'),
        ],
      ),
    );
  }
}
