import 'package:flutter/material.dart';
import '../widgets/app_logo.dart';
import 'marketplace_screen.dart';
import 'social_feed_screen.dart';
import 'profile_screen.dart';
import '../widgets/gradient_header.dart';
import '../lib/main.dart';
import 'ai_chat_screen.dart';
import '../widgets/animated_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    _HomeTab(),
    MarketplaceScreen(),
    SocialFeedScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final role = RoleProvider.of(context).role;
    final accentColor = _roleAccent(role);
    final greeting = 'Welcome, $role!';
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: accentColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Marketplace',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Social',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          navigateWithFade(context, const AIChatScreen());
        },
        icon: const Icon(Icons.smart_toy),
        label: const Text('Ask AI'),
        backgroundColor: accentColor,
      ),
    );
  }

  Color _roleAccent(String role) {
    switch (role) {
      case 'Developer':
        return Colors.blue;
      case 'NGO':
        return Colors.green;
      case 'Youth Leader':
        return Colors.purple;
      case 'Donor':
        return Colors.orange;
      case 'Mentor':
        return Colors.teal;
      default:
        return Colors.pinkAccent;
    }
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // The previous home screen content goes here (impact metrics, quick actions, etc.)
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AppLogo(size: 80),
          SizedBox(height: 24),
          Text('Welcome to Collab4SDG!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('Unite. Innovate. Impact.', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

class _AIAssistant extends StatelessWidget {
  final String role;
  const _AIAssistant({required this.role});
  @override
  Widget build(BuildContext context) {
    final suggestions = _aiSuggestions(role);
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AI Assistant for $role', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ...suggestions.map((s) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  children: [
                    const Icon(Icons.bolt, color: Colors.amber),
                    const SizedBox(width: 8),
                    Expanded(child: Text(s)),
                  ],
                ),
              )),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _aiSuggestions(String role) {
    switch (role) {
      case 'Developer':
        return [
          'Recommended: Join the "Tech for Good" hackathon.',
          'AI Match: Bob (Mentor) is looking for a Flutter dev.',
          'Tip: Add your latest project to your portfolio!'
        ];
      case 'NGO':
        return [
          'Recommended: Connect with donors for "Zero Hunger Drive".',
          'AI Match: Alice (Developer) can help build your app.',
          'Tip: Post your project needs in the Social Feed.'
        ];
      case 'Youth Leader':
        return [
          'Recommended: Apply for the "Girls in STEM" initiative.',
          'AI Match: Chloe (Mentor) can guide your advocacy.',
          'Tip: Share your story in the Social Feed!'
        ];
      case 'Donor':
        return [
          'Recommended: Fund the "Solar Schools" project.',
          'AI Match: David (NGO) is seeking support.',
          'Tip: Review project impact reports.'
        ];
      case 'Mentor':
        return [
          'Recommended: Host a workshop for new developers.',
          'AI Match: Eve (Youth Leader) is looking for guidance.',
          'Tip: Endorse your mentees for their skills.'
        ];
      default:
        return ['Explore new opportunities!'];
    }
  }
} 