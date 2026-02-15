import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/college_list_screen.dart';
import 'screens/college_detail_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/college_list': (context) => const CollegeListScreen(),
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
