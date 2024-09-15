import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ionicons/ionicons.dart';
import 'package:new_project/widgets/appbar.dart';

void main() {
  testWidgets('Header widget contains title and icon', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: header(null), // Pass null or mock context if not used in header function
      ),
    ));

    // Check if the AppBar has the correct title
    expect(find.text('Social Learning'), findsOneWidget);

    // Check if the AppBar has the notification icon
    expect(find.byIcon(Ionicons.notifications_outline), findsOneWidget);
  });
}
