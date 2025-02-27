import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://sm.ign.com/t/ign_za/cover/t/the-unforg/the-unforgivable_pg5c.128.jpg'),
          ),
        ),
        title: Text('Mi amor ❤️'),
        centerTitle: false,
      ),
    );
  }
}
