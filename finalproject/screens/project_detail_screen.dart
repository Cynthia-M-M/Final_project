import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'package:lottie/lottie.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Map<String, String> project;
  const ProjectDetailScreen({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project['title'] ?? 'Project Detail')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project['title'] ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text('${project['sdg']} • ${project['location']}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            Text(project['description'] ?? '', style: const TextStyle(fontSize: 16)),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset('assets/lottie/celebrate.json', height: 120),
                            const SizedBox(height: 16),
                            const Text('You joined the project!', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Join Project'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(projectTitle: project['title'] ?? ''),
                      ),
                    );
                  },
                  child: const Text('Chat'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 