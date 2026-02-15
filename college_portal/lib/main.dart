import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/college_list_screen.dart';
import 'screens/college_detail_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/main_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/saved_colleges_screen.dart';
import 'screens/search_screen.dart';
import 'models/college.dart';

void main() {
  runApp(const CollegePortalApp());
}

class CollegePortalApp extends StatelessWidget {
  const CollegePortalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/college_list': (context) => const CollegeListScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/saved': (context) => const SavedCollegesScreen(),
        '/search': (context) => const SearchScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/college_detail') {
          final college = settings.arguments as College;
          return MaterialPageRoute(
            builder: (context) => CollegeDetailScreen(college: college),
          );
        }
        return null;
      },
    );
  }
}
