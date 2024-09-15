import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:new_project/auth/register/register.dart';
import 'package:new_project/view_models/auth/register_view_model.dart';
import 'package:ionicons/ionicons.dart'; // Ensure you import this to use Ionicons

void main() {
  group('Register widget tests', () {
    // Helper method to create a testable widget tree
    Widget createTestWidget(RegisterViewModel viewModel) {
      return ChangeNotifierProvider<RegisterViewModel>(
        create: (_) => viewModel,
        child: MaterialApp(
          home: Scaffold(
            body: Register(),
          ),
        ),
      );
    }

    testWidgets('Register widget basic structure test', (WidgetTester tester) async {
      // Create a RegisterViewModel instance
      final viewModel = RegisterViewModel();

      // Build the Register widget within a MaterialApp and ChangeNotifierProvider
      await tester.pumpWidget(createTestWidget(viewModel));

      // Check for the presence of the welcome text
      expect(find.text('Welcome to Social Learning\nCreate a new account and connect with friends'), findsOneWidget);

      // Check for the presence of the "Sign Up" button
      expect(find.widgetWithText(ElevatedButton, 'SIGN UP'), findsOneWidget);
    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));

      // Check for username field
      expect(find.byIcon(Ionicons.person_outline), findsOneWidget);

    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));


      // Check for email field
      expect(find.byIcon(Ionicons.mail_outline), findsOneWidget);

    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));


      // Check for country field
      expect(find.byIcon(Ionicons.pin_outline), findsOneWidget);

    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));


      // Check for password field
      expect(find.byIcon(Ionicons.lock_closed_outline), findsOneWidget);

    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));

      // Check for confirm password field
      expect(find.byIcon(Ionicons.lock_open_outline), findsOneWidget);
    });

    testWidgets('Presence of form fields', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));

      // Check for username field
      expect(find.byIcon(Ionicons.person_outline), findsOneWidget);

      // Check for email field
      expect(find.byIcon(Ionicons.mail_outline), findsOneWidget);

      // Check for country field
      expect(find.byIcon(Ionicons.pin_outline), findsOneWidget);

      // Check for password field
      expect(find.byIcon(Ionicons.lock_closed_outline), findsOneWidget);

      // Check for confirm password field
      expect(find.byIcon(Ionicons.lock_open_outline), findsOneWidget);
    });

    testWidgets('Verify "Sign Up" button initial state', (WidgetTester tester) async {
      final viewModel = RegisterViewModel();

      // Build the Register widget
      await tester.pumpWidget(createTestWidget(viewModel));

      // Check that the "Sign Up" button is initially enabled
      final signUpButton = tester.widget<ElevatedButton>(find.widgetWithText(ElevatedButton, 'SIGN UP'));
      expect(signUpButton.onPressed, isNotNull); // Adjust this based on your app logic
    });

  });
}
