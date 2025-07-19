import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../lib/main.dart';

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
    final roleColors = [
      Colors.blue, // Developer
      Colors.green, // NGO
      Colors.purple, // Youth Leader
      Colors.orange, // Donor
      Colors.teal, // Mentor
    ];
    final roleLotties = [
      'assets/lottie/developer.json',
      'assets/lottie/ngo.json',
      'assets/lottie/youth.json',
      'assets/lottie/donor.json',
      'assets/lottie/mentor.json',
    ];
    final selectedColor = selectedRoleIndex != null ? roleColors[selectedRoleIndex!] : Colors.blue;
    final selectedLottie = selectedRoleIndex != null ? roleLotties[selectedRoleIndex!] : null;
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Collab4SDG!')),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [selectedColor.withOpacity(0.7), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              if (selectedLottie != null)
                Container(
                  height: 180,
                  alignment: Alignment.center,
                  child: Text('Lottie: $selectedLottie', style: TextStyle(color: selectedColor)), // Placeholder
                ),
              const SizedBox(height: 16),
              Text(
                selectedRoleIndex != null ? 'Hello, ${roles[selectedRoleIndex!]}!' : 'Select your role:',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
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
                        final role = roles[selectedRoleIndex!];
                        RoleProvider.of(context).setRole(role);
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    : null,
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 