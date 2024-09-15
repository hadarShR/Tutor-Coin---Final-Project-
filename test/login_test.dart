import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_project/auth/login/login.dart';
import 'package:new_project/auth/register/register.dart';
import 'package:new_project/view_models/auth/login_view_model.dart';
import 'package:provider/provider.dart';
import 'package:new_project/view_models/auth/login_view_model.dart';
//import 'package:new_project/screens/login/login.dart';

void main() {
  group('Login Widget Tests', () {
    testWidgets('displays welcome text', (WidgetTester tester) async {
      // Set up the LoginViewModel
      final loginViewModel = LoginViewModel();

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => loginViewModel,
            child: Login(),
          ),
        ),
      );

      // Verify that the welcome text is displayed
      expect(find.text('Welcome back!'), findsOneWidget);
      expect(find.text('Log into your account and get started!'), findsOneWidget);
    });


    testWidgets('displays login button', (WidgetTester tester) async {
      final loginViewModel = LoginViewModel();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => loginViewModel,
            child: Login(),
          ),
        ),
      );

      // Verify that the login button is displayed
      expect(find.text('LOG IN'), findsOneWidget);
    });

    testWidgets('displays email and password fields with icons', (WidgetTester tester) async {
      final loginViewModel = LoginViewModel();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<LoginViewModel>(
            create: (_) => loginViewModel,
            child: Login(),
          ),
        ),
      );

      // Verify that email and password fields are displayed with correct icons
      expect(find.byIcon(Ionicons.mail_outline), findsOneWidget);
      expect(find.byIcon(Ionicons.lock_closed_outline), findsOneWidget);
    });



  });
}
