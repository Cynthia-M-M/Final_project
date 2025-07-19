import 'package:flutter/material.dart';

class SocialFeedScreen extends StatelessWidget {
  const SocialFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> posts = [
      {
        'user': 'Alice',
        'content': 'Just launched a new SDG 6 project in Kenya!'
      },
      {
        'user': 'Bob',
        'content': 'Looking for Flutter devs for a climate action app.'
      },
      {
        'user': 'You',
        'content': 'Excited to join the Green City Initiative!'
      },
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Social Feed')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: posts.map((post) => Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(post['user']![0])),
            title: Text(post['user']!),
            subtitle: Text(post['content']!),
          ),
        )).toList(),
      ),
    );
  }
} 