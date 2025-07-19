import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {'title': 'New Project Match!', 'body': 'You have a new recommended project: Girls in STEM.'},
      {'title': 'Endorsement Received', 'body': 'Alice endorsed you for Teamwork.'},
      {'title': 'Message', 'body': 'Bob: Let\'s collaborate on the Green City Initiative!'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: notifications.map((n) => Card(
          child: ListTile(
            leading: const Icon(Icons.notifications, color: Colors.teal),
            title: Text(n['title']!),
            subtitle: Text(n['body']!),
          ),
        )).toList(),
      ),
    );
  }
} 