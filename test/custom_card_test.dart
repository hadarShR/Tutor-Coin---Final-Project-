import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/components/custom_card.dart'; // Update with the correct import path

void main() {
  testWidgets('CustomCard renders with correct properties and triggers onTap', (WidgetTester tester) async {
    // Define a mock callback function
    bool tapped = false;
    void mockOnTap() {
      tapped = true;
    }

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(
            child: Text('Test Card'),
            onTap: mockOnTap,
            borderRadius: BorderRadius.circular(12),
            elevated: true,
          ),
        ),
      ),
    );

    // Verify that the CustomCard renders with the correct child
    expect(find.text('Test Card'), findsOneWidget);

    // Verify that the CustomCard is wrapped in an InkWell
    expect(find.byType(InkWell), findsOneWidget);

    // Tap the CustomCard
    await tester.tap(find.byType(CustomCard));
    await tester.pump(); // Rebuild the widget after the state change

    // Verify that the onTap callback is called
    expect(tapped, true);

    // Test the decoration
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.borderRadius, BorderRadius.circular(12));
    expect(decoration.color, Theme.of(tester.element(find.byType(CustomCard))).cardColor);
  });

  testWidgets('CustomCard handles elevated property correctly', (WidgetTester tester) async {
    // Build the widget with elevated set to false
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomCard(
            child: Text('Test Card Elevated'),
            onTap: () {},
            borderRadius: BorderRadius.circular(8),
            elevated: false,
          ),
        ),
      ),
    );

    // Verify that the CustomCard is rendered
    expect(find.text('Test Card Elevated'), findsOneWidget);

    // Test the decoration for elevated = false
    final container = tester.widget<Container>(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;
    expect(decoration.borderRadius, BorderRadius.circular(8));
    expect(decoration.color, Theme.of(tester.element(find.byType(CustomCard))).cardColor);
  });
}
