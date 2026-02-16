import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isDarkMode = prefs.getBool('darkMode') ?? false;

  runApp(CollegePortalApp(initialDarkMode: isDarkMode));
}

class CollegePortalApp extends StatefulWidget {
  final bool initialDarkMode;

  const CollegePortalApp({super.key, required this.initialDarkMode});

  static void toggleTheme(BuildContext context) {
    final state = context.findAncestorStateOfType<_CollegePortalAppState>();
    state?.toggleTheme();
  }

  @override
  State<CollegePortalApp> createState() => _CollegePortalAppState();
}

class _CollegePortalAppState extends State<CollegePortalApp> {
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.initialDarkMode;
  }

  void toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
    await prefs.setBool('darkMode', _isDarkMode);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Portal',
      theme: ThemeData(
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(
          _isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
        ),
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
