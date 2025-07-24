import 'package:flutter/material.dart';
import '../models/project_model.dart';
import '../models/user_model.dart';

class ProjectProvider extends ChangeNotifier {
  List<ProjectModel> _projects = [];
  List<ProjectModel> _featuredProjects = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ProjectModel> get projects => _projects;
  List<ProjectModel> get featuredProjects => _featuredProjects;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadProjects() async {
    try {
      _setLoading(true);
      _clearError();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Mock projects data
      _projects = [
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
        ProjectModel(
          id: '3',
          title: 'Sustainable Agriculture App',
          description: 'Creating a platform to connect smallholder farmers with sustainable farming practices.',
          ownerId: 'user3',
          targetSDGs: [SDGGoal.zeroHunger, SDGGoal.lifeOnLand, SDGGoal.decentWork],
          requiredSkills: ['Node.js', 'MongoDB', 'Mobile Dev'],
          status: ProjectStatus.active,
          startDate: DateTime.now().subtract(const Duration(days: 15)),
          location: 'Lagos, Nigeria',
          isRemote: false,
          maxParticipants: 10,
          currentParticipants: ['user3', 'user4', 'user5'],
          applicants: ['user6'],
          metadata: {},
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];

      _featuredProjects = _projects.where((p) => p.status == ProjectStatus.active).toList();
      
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}