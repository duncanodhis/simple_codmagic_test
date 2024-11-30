import 'package:flutter/material.dart';

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
                        onSave: (updatedName, updatedAge, updatedProfession,
                            updatedInterests, updatedAboutMe) {
                          setState(() {
                            _name = updatedName;
                            _age = updatedAge;
                            _profession = updatedProfession;
                            _interests = updatedInterests;
                            _aboutMe = updatedAboutMe;
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
            ],
          ),
        ),
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  final String name;
  final int age;
  final String profession;
  final String interests;
  final String aboutMe;
  final Function(String, int, String, String, String) onSave;

  const EditProfileScreen({
    required this.name,
    required this.age,
    required this.profession,
    required this.interests,
    required this.aboutMe,
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

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age.toString());
    _professionController = TextEditingController(text: widget.profession);
    _interestsController = TextEditingController(text: widget.interests);
    _aboutMeController = TextEditingController(text: widget.aboutMe);
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget.onSave(
                    _nameController.text,
                    int.tryParse(_ageController.text) ?? widget.age,
                    _professionController.text,
                    _interestsController.text,
                    _aboutMeController.text,
                  );
                  Navigator.pop(context);
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
