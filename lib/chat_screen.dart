import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _matches = [
    {
      'name': 'Emma',
      'message': 'Hey, how are you?',
      'avatar': 'lib/assets/user1.jpg',
      'time': '2m ago',
    },
    {
      'name': 'Alex',
      'message': 'Wanna grab coffee?',
      'avatar': 'lib/assets/user2.jpg',
      'time': '1h ago',
    },
    {
      'name': 'Sophia',
      'message': 'Let’s plan our hike!',
      'avatar': 'lib/assets/user3.jpg',
      'time': '3h ago',
    },
    {
      'name': 'Liam',
      'message': 'Are you free this weekend?',
      'avatar': 'lib/assets/user4.jpg',
      'time': '5h ago',
    },
    {
      'name': 'Olivia',
      'message': 'Loved the book recommendation!',
      'avatar': 'lib/assets/user5.jpg',
      'time': '1d ago',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Matches'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: _matches.length,
        itemBuilder: (context, index) {
          final match = _matches[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(match['avatar']),
            ),
            title: Text(match['name']),
            subtitle: Text(match['message']),
            trailing: Text(match['time']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => IndividualChatScreen(
                    name: match['name'],
                    avatar: match['avatar'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class IndividualChatScreen extends StatefulWidget {
  final String name;
  final String avatar;

  const IndividualChatScreen(
      {Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  _IndividualChatScreenState createState() => _IndividualChatScreenState();
}

class _IndividualChatScreenState extends State<IndividualChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text.trim());
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.avatar),
            ),
            SizedBox(width: 10),
            Text(widget.name),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _messages[_messages.length - 1 - index],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
