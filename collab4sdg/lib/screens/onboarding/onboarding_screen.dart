import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> roles = [
    'Developer',
    'NGO',
    'Youth Leader',
    'Donor',
    'Mentor',
  ];
  int? selectedRoleIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Collab4SDG!')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Select your role:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...List.generate(roles.length, (index) {
              return ListTile(
                title: Text(roles[index]),
                leading: Radio<int>(
                  value: index,
                  groupValue: selectedRoleIndex,
                  onChanged: (int? value) {
                    setState(() {
                      selectedRoleIndex = value;
                    });
                  },
                ),
              );
            }),
            const Spacer(),
            ElevatedButton(
              onPressed: selectedRoleIndex != null
                  ? () {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  : null,
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
} 