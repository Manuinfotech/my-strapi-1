import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:college_portal/screens/profile/profile_screen.dart';

void main() {
  testWidgets('Profile screen displays user info and options', (WidgetTester tester) async {
    // Provide a MaterialApp to provide directionality
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    // Verify user info
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('john.doe@example.com'), findsOneWidget);

    // Verify menu options
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);
    expect(find.text('Application History'), findsOneWidget);
    expect(find.text('Help & Support'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}
