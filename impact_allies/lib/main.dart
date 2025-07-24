import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/projects/projects_screen.dart';
import 'screens/matching/matching_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/user_provider.dart';
import 'providers/project_provider.dart';
import 'utils/theme.dart';

void main() {
  runApp(const ImpactAlliesApp());
}

class ImpactAlliesApp extends StatelessWidget {
  const ImpactAlliesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
      ],
      child: MaterialApp(
        title: 'ImpactAllies',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/onboarding': (context) => const OnboardingScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/projects': (context) => const ProjectsScreen(),
          '/matching': (context) => const MatchingScreen(),
        },
      ),
    );
  }
}