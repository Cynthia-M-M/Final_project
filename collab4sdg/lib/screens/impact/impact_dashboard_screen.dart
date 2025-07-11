import 'package:flutter/material.dart';

class ImpactDashboardScreen extends StatelessWidget {
  const ImpactDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboard = [
      {'name': 'Alice', 'score': 320},
      {'name': 'Bob', 'score': 290},
      {'name': 'You', 'score': 120},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Impact Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text('Your SDG Progress', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            LinearProgressIndicator(value: 0.7, minHeight: 12),
            const SizedBox(height: 24),
            const Text('Badges', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            Row(
              children: const [
                Icon(Icons.emoji_events, color: Colors.amber, size: 32),
                SizedBox(width: 8),
                Icon(Icons.volunteer_activism, color: Colors.green, size: 32),
                SizedBox(width: 8),
                Icon(Icons.public, color: Colors.blue, size: 32),
                SizedBox(width: 8),
                Icon(Icons.star, color: Colors.purple, size: 32),
                SizedBox(width: 8),
                Icon(Icons.leaderboard, color: Colors.orange, size: 32),
              ],
            ),
            const SizedBox(height: 24),
            const Text('Achievements', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Joined 3 SDG projects'),
            ),
            const ListTile(
              leading: Icon(Icons.check_circle, color: Colors.green),
              title: Text('Contributed to SDG 6: Clean Water'),
            ),
            const SizedBox(height: 24),
            const Text('Leaderboard', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 12),
            ...leaderboard.map((entry) => ListTile(
                  leading: Icon(
                    entry['name'] == 'You' ? Icons.person : Icons.emoji_events,
                    color: entry['name'] == 'You' ? Colors.teal : Colors.amber,
                  ),
                  title: Text(entry['name']),
                  trailing: Text('${entry['score']} pts', style: const TextStyle(fontWeight: FontWeight.bold)),
                )),
          ],
        ),
      ),
    );
  }
} 