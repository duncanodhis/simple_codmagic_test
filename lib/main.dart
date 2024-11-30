import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'auth_screen.dart';
import 'main_screen.dart';
import 'profile_screen.dart';
import 'chat_screen.dart';
import 'settings_screen.dart';
import 'swipe_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/auth': (context) => AuthScreen(),
        '/main': (context) => MainScreen(),
        '/profile': (context) => ProfileScreen(),
        '/chat': (context) => ChatScreen(),
        '/settings': (context) => SettingsScreen(),
        '/swipe': (context) => SwipeScreen(),
      },
    );
  }
}
