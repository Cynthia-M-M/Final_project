import 'package:flutter/material.dart';
import 'project_detail_screen.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> projects = [
      {
        'title': 'Clean Water for All',
        'sdg': 'SDG 6',
        'location': 'Kenya',
        'description': 'Providing clean water access to rural communities.'
      },
      {
        'title': 'Girls in STEM',
        'sdg': 'SDG 5',
        'location': 'India',
        'description': 'Empowering girls through STEM education.'
      },
      {
        'title': 'Green City Initiative',
        'sdg': 'SDG 11',
        'location': 'Brazil',
        'description': 'Urban sustainability and green spaces.'
      },
    ];
    // Mock user profile for AI logic
    final userSkills = ['STEM', 'AI', 'Water'];
    final recommended = projects.where((p) => userSkills.any((s) => p['title']!.contains(s) || p['description']!.contains(s))).toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Project Marketplace')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Recommended for You
            if (recommended.isNotEmpty) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Recommended for You', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: recommended.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    final project = recommended[index];
                    return SizedBox(
                      width: 220,
                      child: Card(
                        color: Colors.teal[50],
                        child: ListTile(
                          title: Text(project['title']!),
                          subtitle: Text('${project['sdg']} • ${project['location']}'),
                          trailing: Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailScreen(project: project),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
            TextField(
              decoration: InputDecoration(
                hintText: 'Search projects...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];
                  return Card(
                    child: ListTile(
                      title: Text(project['title']!),
                      subtitle: Text('${project['sdg']} • ${project['location']}'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailScreen(project: project),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 