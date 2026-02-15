import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:college_portal/main.dart';
import 'package:college_portal/screens/home_screen.dart';

void main() {
  testWidgets('App loads home screen and displays title', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CollegePortalApp());

    // Verify that our app starts with the Home Screen title.
    expect(find.text('College Portal'), findsOneWidget);
    expect(find.text('Top Colleges'), findsOneWidget);

    // Verify categories are present
    expect(find.text('Colleges'), findsOneWidget);
    expect(find.text('Exams'), findsOneWidget);
  });

  testWidgets('Navigation to College List works', (WidgetTester tester) async {
    await tester.pumpWidget(const CollegePortalApp());

    // Tap on 'View All'
    await tester.tap(find.text('View All'));
    await tester.pumpAndSettle();

    // Verify we are on the College List Screen
    expect(find.byType(ListView), findsWidgets);
  });
}
