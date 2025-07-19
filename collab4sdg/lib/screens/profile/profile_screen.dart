import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'SDG Champion';
  String role = 'Developer';
  String skills = 'Flutter, AI, SDGs';
  int reputation = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Profile')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 32,
                  child: Icon(Icons.account_circle, size: 48),
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    Text(role, style: const TextStyle(fontSize: 16, color: Colors.teal)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Skills', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            TextFormField(
              initialValue: skills,
              decoration: const InputDecoration(hintText: 'Your skills'),
              onChanged: (val) => setState(() => skills = val),
            ),
            const SizedBox(height: 24),
            const Text('Reputation', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber[700]),
                const SizedBox(width: 8),
                Text('$reputation', style: const TextStyle(fontSize: 18)),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Profile updated!')),
                );
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
} 