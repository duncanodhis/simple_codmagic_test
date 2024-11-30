import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  final List<Map<String, dynamic>> _profiles = [
    {
      'name': 'Emma',
      'age': 26,
      'bio': 'Software engineer who loves hiking and coffee',
      'image': 'lib/assets/user1.jpg',
    },
    {
      'name': 'Alex',
      'age': 29,
      'bio': 'Travel photographer with a passion for adventure',
      'image': 'lib/assets/user2.jpg',
    },
    {
      'name': 'Sophia',
      'age': 24,
      'bio': 'Fitness enthusiast who loves cooking',
      'image': 'lib/assets/user3.jpg',
    },
    {
      'name': 'Liam',
      'age': 28,
      'bio': 'Digital nomad exploring the world one city at a time',
      'image': 'lib/assets/user4.jpg',
    },
    {
      'name': 'Olivia',
      'age': 25,
      'bio': 'Bookworm and aspiring novelist',
      'image': 'lib/assets/user5.jpg',
    },
  ];

  int _currentIndex = 0;

  void _swipeRight() {
    setState(() {
      if (_currentIndex < _profiles.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _swipeLeft() {
    setState(() {
      if (_currentIndex < _profiles.length - 1) {
        _currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_profiles.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('No more profiles to show'),
        ),
      );
    }

    final profile = _profiles[_currentIndex];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    profile['image']), // Use AssetImage for local images
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${profile['name']}, ${profile['age']}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    profile['bio'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'dislike',
                  backgroundColor: Colors.red,
                  onPressed: _swipeLeft,
                  child: Icon(Icons.close),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  heroTag: 'like',
                  backgroundColor: Colors.green,
                  onPressed: _swipeRight,
                  child: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
