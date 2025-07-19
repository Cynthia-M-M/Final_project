import 'package:flutter/material.dart';
import '../marketplace/marketplace_screen.dart';
import '../impact/impact_dashboard_screen.dart';
import '../knowledge/knowledge_hub_screen.dart';
import '../profile/profile_screen.dart';
import 'dart:async';
import '../marketplace/project_detail_screen.dart';
import '../chat/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _startDemo(BuildContext context) async {
    // Simulate navigation through the app
    await Future.delayed(const Duration(milliseconds: 500));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MarketplaceScreen()),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectDetailScreen(
          project: {
            'title': 'Clean Water for All',
            'sdg': 'SDG 6',
            'location': 'Kenya',
            'description': 'Providing clean water access to rural communities.'
          },
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(projectTitle: 'Clean Water for All'),
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ImpactDashboardScreen()),
    );
    await Future.delayed(const Duration(seconds: 1));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KnowledgeHubScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {
        'title': 'Clean Water for All',
        'sdg': 'SDG 6',
        'location': 'Kenya',
      },
      {
        'title': 'Girls in STEM',
        'sdg': 'SDG 5',
        'location': 'India',
      },
    ];
    final List<Map<String, String>> successStories = [
      {
        'title': 'Water for Life',
        'desc': 'Provided clean water to 10,000+ people in Kenya.',
      },
      {
        'title': 'STEM Queens',
        'desc': 'Empowered 500+ girls in India to pursue STEM careers.',
      },
      {
        'title': 'Green City',
        'desc': 'Transformed 3 cities with urban gardens.',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collab4SDG Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Animated Impact Metrics
            const Text(
              'Global Impact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _AnimatedImpactMetrics(),
            const SizedBox(height: 24),
            const Text(
              'Recommended Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...projects.map((project) => Card(
                  child: ListTile(
                    title: Text(project['title']!),
                    subtitle: Text('${project['sdg']} • ${project['location']}'),
                    trailing: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Join'),
                    ),
                  ),
                )),
            const SizedBox(height: 24),
            // Success Stories Carousel
            const Text(
              'Success Stories',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 120,
              child: _SuccessStoriesCarousel(stories: successStories),
            ),
            const SizedBox(height: 24),
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Create Project'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Find Collaborators'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MarketplaceScreen(),
                      ),
                    );
                  },
                  child: const Text('Browse Projects'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImpactDashboardScreen(),
                      ),
                    );
                  },
                  child: const Text('Impact Dashboard'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const KnowledgeHubScreen(),
                      ),
                    );
                  },
                  child: const Text('Knowledge Hub'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _startDemo(context),
        icon: const Icon(Icons.play_arrow),
        label: const Text('Demo Mode'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}

// Animated Impact Metrics Widget
class _AnimatedImpactMetrics extends StatefulWidget {
  const _AnimatedImpactMetrics({Key? key}) : super(key: key);

  @override
  State<_AnimatedImpactMetrics> createState() => _AnimatedImpactMetricsState();
}

class _AnimatedImpactMetricsState extends State<_AnimatedImpactMetrics> {
  int projects = 0;
  int users = 0;
  int impact = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {
        if (projects < 128) projects++;
        if (users < 5400) users += 50;
        if (impact < 120000) impact += 1500;
      });
      if (projects >= 128 && users >= 5400 && impact >= 120000) {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ImpactStat(label: 'Projects', value: projects),
        _ImpactStat(label: 'Users', value: users),
        _ImpactStat(label: 'Lives Impacted', value: impact),
      ],
    );
  }
}

class _ImpactStat extends StatelessWidget {
  final String label;
  final int value;
  const _ImpactStat({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// Success Stories Carousel Widget
class _SuccessStoriesCarousel extends StatefulWidget {
  final List<Map<String, String>> stories;
  const _SuccessStoriesCarousel({required this.stories});
  @override
  State<_SuccessStoriesCarousel> createState() => _SuccessStoriesCarouselState();
}

class _SuccessStoriesCarouselState extends State<_SuccessStoriesCarousel> {
  int _current = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        _current = (_current + 1) % widget.stories.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.stories[_current];
    return Card(
      color: Colors.teal[50],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(story['title']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(story['desc']!, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
} 