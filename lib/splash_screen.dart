import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder for the logo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color:
                    Colors.grey[300], // Light grey background for placeholder
                shape: BoxShape.circle, // Circular shape
              ),
              child: Center(
                child: Text(
                  'BM', // Initials of the app (BadgieMate)
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700], // Darker grey text
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // App name or tagline
            Text(
              'BadgieMate',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
