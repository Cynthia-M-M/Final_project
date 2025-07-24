import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _currentUser;
  List<UserModel> _users = [];
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get currentUser => _currentUser;
  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void setCurrentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    try {
      _setLoading(true);
      _clearError();
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Mock users data
      _users = [
        UserModel(
          id: '1',
          name: 'John Developer',
          email: 'john@example.com',
          userType: UserType.developer,
          bio: 'Full-stack developer passionate about SDG projects',
          skills: ['Flutter', 'Node.js', 'Python'],
          interestedSDGs: [SDGGoal.qualityEducation, SDGGoal.climateAction],
          location: 'Nairobi, Kenya',
          experienceYears: 5,
          languages: ['English', 'Swahili'],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
        UserModel(
          id: '2',
          name: 'Sarah NGO Leader',
          email: 'sarah@ngo.org',
          userType: UserType.ngo,
          bio: 'Leading sustainable development initiatives',
          skills: ['Project Management', 'Community Outreach'],
          interestedSDGs: [SDGGoal.cleanWater, SDGGoal.sustainableCities],
          location: 'Lagos, Nigeria',
          organization: 'Green Future NGO',
          experienceYears: 8,
          languages: ['English', 'Yoruba'],
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      ];
      
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