import 'package:flutter/material.dart';

class DiscoverPeopleScreen extends StatelessWidget {
  const DiscoverPeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> people = [
      {'name': 'Alice', 'role': 'NGO', 'skills': 'Water, Community'},
      {'name': 'Bob', 'role': 'Developer', 'skills': 'Flutter, AI'},
      {'name': 'Chloe', 'role': 'Youth Leader', 'skills': 'STEM, Advocacy'},
      {'name': 'David', 'role': 'Donor', 'skills': 'Finance, SDGs'},
      {'name': 'Eve', 'role': 'Mentor', 'skills': 'Leadership, Tech'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Discover People')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: people.map((person) => Card(
          child: ListTile(
            leading: CircleAvatar(child: Text(person['name']![0])),
            title: Text(person['name']!),
            subtitle: Text('${person['role']} • ${person['skills']}'),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Connect'),
            ),
          ),
        )).toList(),
      ),
    );
  }
} 