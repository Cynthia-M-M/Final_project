import 'package:flutter/material.dart';
import '../screens/landing_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/onboarding_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/marketplace_screen.dart';
import '../screens/project_detail_screen.dart';
import '../screens/social_feed_screen.dart';
import '../screens/leaderboard_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/my_applications_screen.dart';
import '../screens/saved_projects_screen.dart';
import '../screens/discover_people_screen.dart';

final Gradient sdgGradient = const LinearGradient(
  colors: [
    Color(0xFF43A047), // SDG green
    Color(0xFF1976D2), // SDG blue
    Color(0xFFE91E63), // SDG pink
    Color(0xFFFFEB3B), // SDG yellow
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

ThemeData vibrantTheme(Brightness brightness) {
  return ThemeData(
    brightness: brightness,
    primaryColor: const Color(0xFF43A047),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF43A047),
      brightness: brightness,
    ).copyWith(
      secondary: const Color(0xFFFF9800),
      primary: const Color(0xFF43A047),
      surface: brightness == Brightness.light ? Colors.white : Colors.grey[900],
    ),
    scaffoldBackgroundColor: brightness == Brightness.light ? Colors.white : Colors.grey[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: brightness == Brightness.light ? Colors.white : Colors.white),
      titleTextStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFE91E63),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        elevation: 4,
        shadowColor: Colors.black26,
      ),
    ),
    cardTheme: CardTheme(
      color: brightness == Brightness.light ? Colors.white : Colors.grey[850],
      elevation: 6,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF9800),
      foregroundColor: Colors.white,
      elevation: 6,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: brightness == Brightness.light ? Colors.grey[100] : Colors.grey[800],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}

class RoleProvider extends InheritedWidget {
  final String role;
  final void Function(String) setRole;

  const RoleProvider({
    Key? key,
    required this.role,
    required this.setRole,
    required Widget child,
  }) : super(key: key, child: child);

  static RoleProvider of(BuildContext context) {
    final RoleProvider? result = context.dependOnInheritedWidgetOfExactType<RoleProvider>();
    assert(result != null, 'No RoleProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(RoleProvider oldWidget) => role != oldWidget.role;
}

void main() {
  runApp(const Collab4SDGApp());
}

class Collab4SDGApp extends StatefulWidget {
  const Collab4SDGApp({Key? key}) : super(key: key);

  @override
  State<Collab4SDGApp> createState() => _Collab4SDGAppState();
}

class _Collab4SDGAppState extends State<Collab4SDGApp> {
  String _role = 'Developer';

  void _setRole(String newRole) {
    setState(() {
      _role = newRole;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RoleProvider(
      role: _role,
      setRole: _setRole,
      child: MaterialApp(
        title: 'Collab4SDG',
        theme: vibrantTheme(Brightness.light),
        darkTheme: vibrantTheme(Brightness.dark),
        themeMode: ThemeMode.system,
        initialRoute: '/landing',
        routes: {
          '/landing': (context) => const LandingScreen(),
          '/splash': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/marketplace': (context) => const MarketplaceScreen(),
          '/project_detail': (context) => const ProjectDetailScreen(project: {}),
          '/social_feed': (context) => const SocialFeedScreen(),
          '/leaderboard': (context) => const LeaderboardScreen(),
          '/notifications': (context) => const NotificationsScreen(),
          '/my_applications': (context) => const MyApplicationsScreen(),
          '/saved_projects': (context) => const SavedProjectsScreen(),
          '/discover_people': (context) => const DiscoverPeopleScreen(),
        },
      ),
    );
  }
}
