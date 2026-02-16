import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:college_portal/screens/auth/login_screen.dart';

void main() {
  testWidgets('Login screen has email and password fields', (WidgetTester tester) async {
    // Provide a MaterialApp to provide directionality
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // Verify email and password fields are present
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
    expect(find.text('Welcome Back'), findsOneWidget);
  });
}
