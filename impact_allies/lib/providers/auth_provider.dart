import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;
  String? _errorMessage;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _user != null;

  Future<bool> signUp({
    required String email,
    required String password,
    required String name,
    required UserType userType,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      _user = UserModel(
        id: 'user_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        email: email,
        userType: userType,
        bio: '',
        skills: [],
        interestedSDGs: [],
        location: '',
        experienceYears: 0,
        languages: [],
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _setLoading(true);
      _clearError();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      _user = UserModel(
        id: 'demo_user',
        name: 'Alex Johnson',
        email: email,
        userType: UserType.developer,
        bio: 'Passionate developer working on SDG projects',
        skills: ['Flutter', 'Dart', 'Firebase'],
        interestedSDGs: [
          SDGGoal.cleanWater,
          SDGGoal.qualityEducation,
          SDGGoal.climateAction,
          SDGGoal.partnerships
        ],
        location: 'Nairobi, Kenya',
        experienceYears: 3,
        languages: ['English', 'Swahili'],
        createdAt: DateTime.now().subtract(const Duration(days: 30)),
        updatedAt: DateTime.now(),
      );

      notifyListeners();
      return true;
    } catch (e) {
      _setError(e.toString());
      return false;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> signOut() async {
    _user = null;
    notifyListeners();
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