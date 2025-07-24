import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../providers/project_provider.dart';
import '../../models/project_model.dart';
import '../../models/user_model.dart';
import '../../widgets/project_card.dart';
import '../../widgets/sdg_indicator.dart';
import '../../utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Mock data for demo
  final List<ProjectModel> _mockProjects = [
    ProjectModel(
      id: '1',
      title: 'Clean Water Initiative',
      description: 'Developing IoT sensors to monitor water quality in rural communities across Kenya.',
      ownerId: 'user1',
      targetSDGs: [SDGGoal.cleanWater, SDGGoal.goodHealth, SDGGoal.sustainableCities],
      requiredSkills: ['IoT', 'Flutter', 'Data Analysis'],
      status: ProjectStatus.active,
      startDate: DateTime.now(),
      location: 'Nairobi, Kenya',
      isRemote: false,
      maxParticipants: 12,
      currentParticipants: ['user1', 'user2'],
      applicants: [],
      metadata: {},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    ProjectModel(
      id: '2',
      title: 'Education Platform for All',
      description: 'Building a mobile learning platform to provide quality education to underserved communities.',
      ownerId: 'user2',
      targetSDGs: [SDGGoal.qualityEducation, SDGGoal.reducedInequalities, SDGGoal.partnerships],
      requiredSkills: ['Flutter', 'Firebase', 'UI/UX'],
      status: ProjectStatus.planning,
      startDate: DateTime.now().add(const Duration(days: 30)),
      location: 'Remote',
      isRemote: true,
      maxParticipants: 20,
      currentParticipants: ['user2'],
      applicants: [],
      metadata: {},
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isWeb = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ImpactAllies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          if (isWeb)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/onboarding');
              },
            ),
        ],
      ),
      body: isWeb ? _buildWebLayout() : _buildMobileLayout(),
      bottomNavigationBar: isWeb ? null : _buildBottomNavigation(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Navigate to create project
        },
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildWebLayout() {
    return Row(
      children: [
        // Sidebar Navigation
        Container(
          width: 250,
          color: Colors.grey[50],
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildNavItem(Icons.home, 'Home', 0),
              _buildNavItem(Icons.work, 'Projects', 1),
              _buildNavItem(Icons.people, 'Matching', 2),
              _buildNavItem(Icons.person, 'Profile', 3),
            ],
          ),
        ),
        // Main Content
        Expanded(
          child: _buildContent(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return _buildContent();
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppTheme.primaryColor : Colors.grey[600],
        ),
        title: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppTheme.primaryColor : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        selected: isSelected,
        selectedTileColor: AppTheme.primaryColor.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeTab();
      case 1:
        return _buildProjectsTab();
      case 2:
        return _buildMatchingTab();
      case 3:
        return _buildProfileTab();
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back, Alex!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Ready to make an impact today?',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 24),
          
          // SDG Goals Section
          const Text(
            'Your SDG Focus Areas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                final sdgs = [
                  SDGGoal.cleanWater,
                  SDGGoal.qualityEducation,
                  SDGGoal.climateAction,
                  SDGGoal.partnerships
                ];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SDGIndicator(sdg: sdgs[index]),
                );
              },
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Featured Projects Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Projects',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: const Text('See All'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _mockProjects.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ProjectCard(project: _mockProjects[index]),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.work_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchingTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.people_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Matching',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.person_outline,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Profile',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() => _selectedIndex = index),
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'Projects',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Matching',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}