import 'package:flutter/material.dart';

class KnowledgeHubScreen extends StatelessWidget {
  const KnowledgeHubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> resources = [
      {'title': 'SDG Toolkit', 'desc': 'Comprehensive guide to all SDGs.'},
      {'title': 'Project Planning 101', 'desc': 'How to start and manage SDG projects.'},
    ];
    final List<Map<String, String>> questions = [
      {'user': 'Jane', 'question': 'How do I find partners for SDG 4 projects?'},
      {'user': 'Ahmed', 'question': 'What are best practices for impact measurement?'},
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Knowledge Hub')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text('Resource Library', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...resources.map((res) => ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: Text(res['title']!),
                  subtitle: Text(res['desc']!),
                )),
            const SizedBox(height: 32),
            const Text('Community Q&A', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            ...questions.map((q) => ListTile(
                  leading: const Icon(Icons.question_answer),
                  title: Text(q['user']!),
                  subtitle: Text(q['question']!),
                )),
          ],
        ),
      ),
    );
  }
} 