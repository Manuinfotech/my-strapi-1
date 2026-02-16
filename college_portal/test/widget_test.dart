import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:college_portal/screens/home_screen.dart';
import 'package:college_portal/screens/college_list_screen.dart';
import 'package:college_portal/screens/college_detail_screen.dart';
import 'package:college_portal/models/college.dart';

void main() {
  Widget createHomeScreen() {
    return MaterialApp(
      home: const HomeScreen(),
      routes: {
        '/college_list': (context) => const CollegeListScreen(),
        '/search': (context) => const Scaffold(body: Center(child: Text('Search Screen'))),
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

  testWidgets('App loads home screen and displays title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(createHomeScreen());

    // Allow any initial animations (like image placeholders) to start
    await tester.pump();

    // Verify that our app starts with the Home Screen title.
    expect(find.text('College Portal'), findsOneWidget);
    expect(find.text('Top Colleges'), findsOneWidget);

    // Verify categories are present
    expect(find.text('Colleges'), findsOneWidget);
    expect(find.text('Exams'), findsOneWidget);
  });

  testWidgets('Navigation to College List works', (WidgetTester tester) async {
    await tester.pumpWidget(createHomeScreen());
    await tester.pump(); // Initial frame

    // Tap on 'View All'
    await tester.tap(find.text('View All'));

    // We cannot use pumpAndSettle here because CachedNetworkImage's CircularProgressIndicator
    // runs infinitely if the image doesn't load (which happens in tests).
    // Instead, we pump for a sufficient duration to allow the navigation animation to complete.
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    // Verify we are on the College List Screen
    expect(find.byType(ListView), findsWidgets);
  });
}
