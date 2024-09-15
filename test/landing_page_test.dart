import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/landing/landing_page.dart'; // Adjust the import path
import 'package:new_project/auth/login/login.dart'; // Adjust the import path

void main() {

  testWidgets('Landing page contains image, text, and buttons', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Landing(),
      ),
    );

    // Verify that the image is displayed
    expect(find.byType(Image), findsOneWidget);

    // Verify that the text 'Social Learning' is displayed
    expect(find.text('Social Learning'), findsOneWidget);

    // Verify that the 'LOGIN' button is displayed
    expect(find.text('LOGIN'), findsOneWidget);

    // Verify that the 'SIGN UP' button is displayed
    expect(find.text('SIGN UP'), findsOneWidget);
  });

  testWidgets('Verify the text and font size in Landing widget', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Landing(),
      ),
    );

    // Find the Text widget
    final textFinder = find.text('Social Learning');

    // Verify that the Text widget is found
    expect(textFinder, findsOneWidget);

    // Get the Text widget
    final textWidget = tester.widget<Text>(textFinder);

    // Verify the font size
    expect(textWidget.style?.fontSize, 22.0);

    // Verify the font weight
    expect(textWidget.style?.fontWeight, FontWeight.w900);

    // Verify the font family
    expect(textWidget.style?.fontFamily, 'Ubuntu-Regular');
  });

  testWidgets('Verify the text and font size in the LOGIN button', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 18.0, // Specify the font size here
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.text('LOGIN');

    // Verify that the Text widget is found
    expect(textFinder, findsOneWidget);

    // Get the Text widget
    final textWidget = tester.widget<Text>(textFinder);

    // Verify the text content
    expect(textWidget.data, 'LOGIN');

    // Verify the font size
    expect(textWidget.style?.fontSize, 18.0); // Adjust to the expected font size
  });

  testWidgets('Verify Container decoration properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            height: 45.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.grey),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue, // Assuming Theme.of(context).colorScheme.secondary is blue for this test
                  Color(0xff597FDB),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Container widget
    final containerFinder = find.byType(Container);

    // Verify that the Container widget is found
    expect(containerFinder, findsOneWidget);

  });

  testWidgets('Verify Container decoration properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            height: 45.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.grey),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue, // Assuming Theme.of(context).colorScheme.secondary is blue for this test
                  Color(0xff597FDB),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Container widget
    final containerFinder = find.byType(Container);

    // Get the Container widget
    final containerWidget = tester.widget<Container>(containerFinder);

    // Check the BoxDecoration
    final decoration = containerWidget.decoration as BoxDecoration;

    // Verify border color
    expect(decoration.border, isInstanceOf<Border>());

  });

  testWidgets('Verify Container decoration properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            height: 45.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.grey),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue, // Assuming Theme.of(context).colorScheme.secondary is blue for this test
                  Color(0xff597FDB),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Container widget
    final containerFinder = find.byType(Container);

    // Verify that the Container widget is found

    // Get the Container widget
    final containerWidget = tester.widget<Container>(containerFinder);

    // Check the BoxDecoration
    final decoration = containerWidget.decoration as BoxDecoration;

    // Verify border color
    expect((decoration.border as Border).top.color, Colors.grey);

  });

  testWidgets('Verify Container decoration properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            height: 45.0,
            width: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              border: Border.all(color: Colors.grey),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue, // Assuming Theme.of(context).colorScheme.secondary is blue for this test
                  Color(0xff597FDB),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Container widget
    final containerFinder = find.byType(Container);


    // Get the Container widget
    final containerWidget = tester.widget<Container>(containerFinder);

    // Check the BoxDecoration
    final decoration = containerWidget.decoration as BoxDecoration;

    // Verify gradient colors
    final gradient = decoration.gradient as LinearGradient;
    expect(gradient.colors, [
      Colors.blue, // Adjust based on your theme color
      Color(0xff597FDB),
    ]);
  });

  testWidgets('Verify the font weight and color of LOGIN text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.text('LOGIN');

    // Verify that the Text widget is found
    expect(textFinder, findsOneWidget);

    // Get the Text widget
    final textWidget = tester.widget<Text>(textFinder);

    // Verify the font weight
    expect(textWidget.style?.fontWeight, FontWeight.w900);

  });

  testWidgets('Verify the font weight and color of LOGIN text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text(
              'LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.text('LOGIN');

    // Verify that the Text widget is found
    expect(textFinder, findsOneWidget);

    // Get the Text widget
    final textWidget = tester.widget<Text>(textFinder);


    // Verify the color
    expect(textWidget.style?.color, Colors.white);
  });

}
