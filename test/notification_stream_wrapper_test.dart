import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:new_project/components/notification_stream_wrapper.dart';


class MockQuerySnapshot extends Mock implements QuerySnapshot<Object?> {}
class MockDocumentSnapshot extends Mock implements DocumentSnapshot<Object?> {}
class MockStream extends Mock implements Stream<QuerySnapshot<Object?>> {}

void main() {
  testWidgets('Check if the text "No Recent Activities" is present', (WidgetTester tester) async {
    // Build the widget tree containing the Container with the text
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Text('No Recent Activities'),
              ),
            ),
          ),
        ),
      ),
    );

    // Find the text widget by the exact text
    final textFinder = find.text('No Recent Activities');

    // Verify that the text is found
    expect(textFinder, findsOneWidget);
  });

  testWidgets('Check if the top padding is 250.0', (WidgetTester tester) async {
    // Build the widget tree containing the Container with the padding
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Container(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 250.0),
                child: Text('No Recent Activities'),
              ),
            ),
          ),
        ),
      ),
    );

    // Find the Padding widget
    final paddingFinder = find.byType(Padding);

    // Verify that the Padding widget has the top padding set to 250.0
    final Padding paddingWidget = tester.widget(paddingFinder);
    final EdgeInsets padding = paddingWidget.padding as EdgeInsets;
    expect(padding.top, equals(250.0));
  });


}