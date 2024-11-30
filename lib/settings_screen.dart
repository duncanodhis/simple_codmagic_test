// settings_screen.dart
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  RangeValues _ageRange = RangeValues(18, 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Notifications'),
            subtitle: Text('Receive match and message notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            subtitle: Text('Switch between light and dark themes'),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Age Range'),
            subtitle: Text(
              '${_ageRange.start.round()} - ${_ageRange.end.round()} years',
            ),
          ),
          Slider(
            value: _ageRange.end,
            min: 18,
            max: 80,
            divisions: 62,
            label: _ageRange.end.round().toString(),
            onChanged: (double value) {
              setState(() {
                _ageRange = RangeValues(_ageRange.start, value);
              });
            },
          ),
          ListTile(
            title: Text('Logout'),
            trailing: Icon(Icons.logout),
            onTap: () {
              // TODO: Implement logout functionality
              Navigator.of(context).pushReplacementNamed('/auth');
            },
          ),
        ],
      ),
    );
  }
}
