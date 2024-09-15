import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_project/components/password_text_field.dart';

void main() {
  testWidgets('PasswordFormBuilder displays the initial value', (
      WidgetTester tester) async {
    // Define test values
    const String initialValue = 'password123';
    const String hintText = 'Enter your password';
    const IconData prefixIcon = Icons.lock;
    const IconData suffixIcon = Icons.visibility;

    // Build the PasswordFormBuilder widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PasswordFormBuilder(
            initialValue: initialValue,
            hintText: hintText,
            prefix: prefixIcon,
            suffix: suffixIcon,
            validateFunction: (value) =>
            value == null || value.isEmpty
                ? 'Password cannot be empty'
                : null,
            onSaved: (value) {},
          ),
        ),
      ),
    );

    // Verify the initial value is displayed correctly
    expect(find.text(initialValue), findsOneWidget);
    expect(find.byIcon(prefixIcon), findsOneWidget);
  });



}

