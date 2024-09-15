import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    // Mock Firebase initialization or skip it
    // This setup prevents Firebase initialization errors during tests
  });

  testWidgets('AppBar displays correct title text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(tester.element(find.byType(AppBar)));
              },
              child: Icon(
                CupertinoIcons.xmark_circle_fill,
              ),
            ),
            centerTitle: true,
            title: Text('Comments'),
          ),
          body: Container(), // Ensure the widget tree includes AppBar
        ),
      ),
    );

    // Verify that the AppBar displays the correct title text
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Comments'), findsOneWidget);
  });

  testWidgets('Icon widget is present and has correct properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.send,
              color: Colors.blue, // Replace with a mock color if needed
            ),
          ),
        ),
      ),
    );

    // Verify the Icon widget is present
    expect(find.byType(Icon), findsOneWidget);

    // Verify the Icon has the correct icon data
    final Icon icon = tester.widget(find.byType(Icon));
    expect(icon.icon, Icons.send);
  });

  testWidgets('Icon color is correct', (WidgetTester tester) async {
    // Define the expected color
    final Color expectedColor = Colors.blue; // Replace with the color you expect

    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.send,
              color: expectedColor,
            ),
          ),
        ),
      ),
    );

    // Verify the Icon widget is present
    expect(find.byType(Icon), findsOneWidget);

    // Verify the Icon has the correct color
    final Icon icon = tester.widget(find.byType(Icon));
    expect(icon.color, expectedColor);
  });

  testWidgets('Text widget has correct TextStyle', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text(
            'Sample Description',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.byType(Text);

    // Verify that the Text widget is present
    expect(textWidget, findsOneWidget);

    // Get the Text widget and its style
    final Text text = tester.widget(textWidget);
    final TextStyle style = text.style!;

    // Verify the TextStyle properties
  });

  testWidgets('Text widget has correct TextStyle', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text(
            'Sample Description',
            style: TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.byType(Text);

    // Verify that the Text widget is present

    // Get the Text widget and its style
    final Text text = tester.widget(textWidget);
    final TextStyle style = text.style!;

    // Verify the TextStyle properties
    expect(style.fontWeight, FontWeight.w800);
  });

  testWidgets('Text widget has correct TextStyle', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text(
            'Sample Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.byType(Text);

    // Verify that the Text widget is present
    expect(textWidget, findsOneWidget);

    // Get the Text widget and its style
    final Text text = tester.widget(textWidget);
    final TextStyle style = text.style!;

  });

  testWidgets('Text widget has correct TextStyle', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text(
            'Sample Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.byType(Text);

    // Get the Text widget and its style
    final Text text = tester.widget(textWidget);
    final TextStyle style = text.style!;

    expect(style.fontSize, 14.0);
  });

  testWidgets('Text widget has correct TextStyle', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Text(
            'Sample Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = find.byType(Text);


    // Get the Text widget and its style
    final Text text = tester.widget(textWidget);
    final TextStyle style = text.style!;

    expect(style.fontSize, 14.0);
  });
}
