import 'package:flutter/material.dart';
import '../lib/main.dart';

class AIChatScreen extends StatefulWidget {
  const AIChatScreen({Key? key}) : super(key: key);

  @override
  State<AIChatScreen> createState() => _AIChatScreenState();
}

class _AIChatScreenState extends State<AIChatScreen> {
  final List<Map<String, String>> messages = [
    {'sender': 'AI', 'text': 'Hi! I am your AI Assistant. Ask me anything about projects, people, or your role.'},
  ];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    setState(() {
      messages.add({'sender': 'You', 'text': text.trim()});
      messages.add({'sender': 'AI', 'text': _getAIResponse(text.trim())});
      _controller.clear();
    });
  }

  String _getAIResponse(String input) {
    final role = RoleProvider.of(context).role;
    input = input.toLowerCase();
    if (input.contains('project')) {
      if (role == 'Developer') return 'As a Developer, you might like the "Tech for Good" or "Solar Schools" projects.';
      if (role == 'NGO') return 'As an NGO, consider posting your project in the marketplace to find collaborators.';
      if (role == 'Mentor') return 'Mentors can join projects to guide teams and share expertise.';
      if (role == 'Donor') return 'Donors can fund impactful projects like "Zero Hunger Drive".';
      if (role == 'Youth Leader') return 'Youth Leaders can apply for initiatives like "Girls in STEM".';
    }
    if (input.contains('people') || input.contains('connect')) {
      if (role == 'Developer') return 'Connect with mentors or NGOs looking for tech talent.';
      if (role == 'NGO') return 'Connect with developers and donors to boost your project.';
      if (role == 'Mentor') return 'Mentors can connect with youth leaders and developers.';
      if (role == 'Donor') return 'Donors can connect with NGOs and project teams.';
      if (role == 'Youth Leader') return 'Connect with mentors and peers to grow your impact.';
    }
    if (input.contains('tip') || input.contains('help')) {
      if (role == 'Developer') return 'Tip: Add your latest project to your portfolio!';
      if (role == 'NGO') return 'Tip: Post your project needs in the Social Feed.';
      if (role == 'Mentor') return 'Tip: Endorse your mentees for their skills.';
      if (role == 'Donor') return 'Tip: Review project impact reports.';
      if (role == 'Youth Leader') return 'Tip: Share your story in the Social Feed!';
    }
    if (input.contains('ai') || input.contains('assistant')) {
      return 'I am here to help you find projects, people, and opportunities. Just ask!';
    }
    return 'Sorry, I don\'t have an answer for that yet. Try asking about projects, people, or tips!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Assistant Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['sender'] == 'You';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.teal[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('${msg['sender']}: ${msg['text']}'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your question...'
                    ),
                    onSubmitted: _sendMessage,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 