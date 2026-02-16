import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/college_detail_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/forgot_password_screen.dart';
import 'screens/profile/edit_profile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/college_list_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/forgot_password': (context) => const ForgotPasswordScreen(),
        '/main': (context) => const MainScreen(),
        '/edit_profile': (context) => const EditProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/notifications': (context) => const NotificationsScreen(),
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
