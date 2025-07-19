import 'package:flutter/material.dart';

class MyApplicationsScreen extends StatelessWidget {
  const MyApplicationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> applications = [
      {'project': 'Clean Water for All', 'status': 'Pending'},
      {'project': 'Girls in STEM', 'status': 'Accepted'},
      {'project': 'Green City Initiative', 'status': 'Rejected'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('My Applications')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: applications.map((app) => Card(
          child: ListTile(
            title: Text(app['project']!),
            trailing: Text(app['status']!, style: TextStyle(
              color: app['status'] == 'Accepted' ? Colors.green : app['status'] == 'Rejected' ? Colors.red : Colors.orange,
              fontWeight: FontWeight.bold,
            )),
          ),
        )).toList(),
      ),
    );
  }
} 