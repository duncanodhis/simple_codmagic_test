import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'auth_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'settings_screen.dart';
import 'swipe_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _screens = [
    SwipeScreen(),
    ChatScreen(),
    ProfileScreen(),
    SettingsScreen(),
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.swipe),
            label: 'Swipe',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Color for the selected item
        unselectedItemColor: Colors.grey, // Color for unselected items
        backgroundColor: Colors.black, // Background color of the navbar
        onTap: _onItemTapped,
      ),
    );
  }
}
