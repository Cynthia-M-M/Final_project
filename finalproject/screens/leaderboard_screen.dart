import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboard = [
      {'name': 'Alice', 'score': 320},
      {'name': 'Bob', 'score': 290},
      {'name': 'You', 'score': 120},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Leaderboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: leaderboard.map((entry) => Card(
          child: ListTile(
            leading: Icon(
              entry['name'] == 'You' ? Icons.person : Icons.emoji_events,
              color: entry['name'] == 'You' ? Colors.teal : Colors.amber,
            ),
            title: Text(entry['name']),
            trailing: Text('${entry['score']} pts', style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        )).toList(),
      ),
    );
  }
} 