import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _name = 'Simon';
  int _age = 28;
  String _profession = 'Software Guy';
  String _interests = 'Coding, Travel, Music';
  String _aboutMe = 'Passionate developer looking for meaningful connections';
  String _location = 'Not set';
  double _distance = 0.0;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Request location permissions
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        setState(() {
          _location = 'Location access denied';
        });
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // You might want to use a geocoding service to convert coordinates to a readable address
      setState(() {
        _location =
            '${position.latitude.toStringAsFixed(4)}, ${position.longitude.toStringAsFixed(4)}';
      });

      // Example of calculating distance (you'd replace this with actual reference point)
      Position referencePosition = Position(
        latitude: 40.7128, // Example: New York City coordinates
        longitude: -74.0060,
        timestamp: DateTime.now(),
        accuracy: 0,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 0,
        headingAccuracy: 0,
      );

      double distanceInMeters = Geolocator.distanceBetween(
          position.latitude,
          position.longitude,
          referencePosition.latitude,
          referencePosition.longitude);

      setState(() {
        _distance = distanceInMeters / 1000; // Convert to kilometers
      });
    } catch (e) {
      setState(() {
        _location = 'Unable to retrieve location';
      });
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('lib/assets/user6.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                '$_name, $_age',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                _profession,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(
                        name: _name,
                        age: _age,
                        profession: _profession,
                        interests: _interests,
                        aboutMe: _aboutMe,
                        location: _location,
                        onSave: (updatedName, updatedAge, updatedProfession,
                            updatedInterests, updatedAboutMe, updatedLocation) {
                          setState(() {
                            _name = updatedName;
                            _age = updatedAge;
                            _profession = updatedProfession;
                            _interests = updatedInterests;
                            _aboutMe = updatedAboutMe;
                            _location = updatedLocation;
                          });
                        },
                      ),
                    ),
                  );
                },
                child: Text('Edit Profile'),
              ),
              SizedBox(height: 20),
              Card(
                child: ListTile(
                  title: Text('Interests'),
                  subtitle: Text(_interests),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('About Me'),
                  subtitle: Text(_aboutMe),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Location'),
                  subtitle: Text(_location),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Distance from Reference Point'),
                  subtitle: Text('${_distance.toStringAsFixed(2)} km'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // It's good practice to dispose of controllers and listeners
    super.dispose();
  }
}

class EditProfileScreen extends StatefulWidget {
  final String name;
  final int age;
  final String profession;
  final String interests;
  final String aboutMe;
  final String location;
  final Function(String, int, String, String, String, String) onSave;

  const EditProfileScreen({
    required this.name,
    required this.age,
    required this.profession,
    required this.interests,
    required this.aboutMe,
    required this.location,
    required this.onSave,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  late TextEditingController _professionController;
  late TextEditingController _interestsController;
  late TextEditingController _aboutMeController;
  late TextEditingController _locationController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age.toString());
    _professionController = TextEditingController(text: widget.profession);
    _interestsController = TextEditingController(text: widget.interests);
    _aboutMeController = TextEditingController(text: widget.aboutMe);
    _locationController = TextEditingController(text: widget.location);
  }

  @override
  void dispose() {
    // Dispose of controllers to prevent memory leaks
    _nameController.dispose();
    _ageController.dispose();
    _professionController.dispose();
    _interestsController.dispose();
    _aboutMeController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: _professionController,
                decoration: InputDecoration(labelText: 'Profession'),
              ),
              TextField(
                controller: _interestsController,
                decoration: InputDecoration(labelText: 'Interests'),
              ),
              TextField(
                controller: _aboutMeController,
                decoration: InputDecoration(labelText: 'About Me'),
                maxLines: 3,
              ),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                readOnly: true, // Location is set automatically
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate inputs
                  if (_validateInputs()) {
                    widget.onSave(
                      _nameController.text,
                      int.tryParse(_ageController.text) ?? widget.age,
                      _professionController.text,
                      _interestsController.text,
                      _aboutMeController.text,
                      _locationController.text,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    // Basic input validation
    if (_nameController.text.isEmpty) {
      _showErrorDialog('Name cannot be empty');
      return false;
    }

    if (_ageController.text.isEmpty) {
      _showErrorDialog('Age cannot be empty');
      return false;
    }

    int? age = int.tryParse(_ageController.text);
    if (age == null || age < 18 || age > 120) {
      _showErrorDialog('Please enter a valid age');
      return false;
    }

    return true;
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Invalid Input'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }
}
