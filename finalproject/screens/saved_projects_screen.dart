import 'package:flutter/material.dart';

class SavedProjectsScreen extends StatelessWidget {
  const SavedProjectsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For demo, show a placeholder list
    final List<Map<String, String>> savedProjects = [
      {'title': 'Solar Schools', 'sdg': 'SDG 7', 'location': 'Bangladesh'},
      {'title': 'Tech for Good', 'sdg': 'SDG 9', 'location': 'USA'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Projects')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Saved projects are only available during this session. (Demo)',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: savedProjects.map((project) => Card(
                child: ListTile(
                  title: Text(project['title']!),
                  subtitle: Text('${project['sdg']} • ${project['location']}'),
                ),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
} 