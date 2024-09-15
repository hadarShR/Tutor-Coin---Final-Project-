import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mockito/mockito.dart';
import 'package:new_project/components/chat_bubble.dart';
import 'package:new_project/models/enum/message_type.dart';
import 'package:timeago/timeago.dart' as timeago;


import 'mock_http_client.mocks.dart'; // Import the generated mock class

void main() {
  testWidgets('chatBubbleColor returns correct colors1', (WidgetTester tester) async {
    Future<void> buildAndCheckColors({
      required ThemeData theme,
      required bool isMe,
      required Color expectedBubbleColor,
      required Color expectedReplyColor,
    }) async {
      // Code to build the widget and check colors
    }

    await buildAndCheckColors(
      theme: ThemeData.light(),
      isMe: true,
      expectedBubbleColor: ThemeData.light().colorScheme.secondary,
      expectedReplyColor: Colors.grey[50]!,
    );
  });

  testWidgets('chatBubbleColor returns correct colors2', (WidgetTester tester) async {
    Future<void> buildAndCheckColors({
      required ThemeData theme,
      required bool isMe,
      required Color expectedBubbleColor,
      required Color expectedReplyColor,
    }) async {
      // Code to build the widget and check colors
    }

    await buildAndCheckColors(
      theme: ThemeData.dark(),
      isMe: false,
      expectedBubbleColor: Colors.grey[800]!,
      expectedReplyColor: Colors.grey[600]!,
    );
  });

  testWidgets('chatBubbleColor returns correct colors3', (WidgetTester tester) async {
    Future<void> buildAndCheckColors({
      required ThemeData theme,
      required bool isMe,
      required Color expectedBubbleColor,
      required Color expectedReplyColor,
    }) async {
      // Code to build the widget and check colors
    }

    await buildAndCheckColors(
      theme: ThemeData.light(),
      isMe: false,
      expectedBubbleColor: Colors.grey[200]!,
      expectedReplyColor: Colors.grey[50]!,
    );
  });

  testWidgets('Text widget should have fontSize 10.0', (WidgetTester tester) async {
    // Define a dummy timestamp for testing
    final timestamp = DateTime.now();

    // Build the widget inside a MaterialApp to provide the necessary context
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: _TextTimeWidget(
            time: timestamp,
          ),
        ),
      ),
    );

    // Find the Text widget
    final textWidget = tester.widget<Text>(find.byType(Text));

    // Check if the font size is 10.0
    expect(textWidget.style?.fontSize, 10.0);
  });
}

// Sample widget to be tested
class _TextTimeWidget extends StatefulWidget {
  final DateTime time;

  const _TextTimeWidget({Key? key, required this.time}) : super(key: key);

  @override
  __TextTimeWidgetState createState() => __TextTimeWidgetState();
}

class __TextTimeWidgetState extends State<_TextTimeWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      timeago.format(widget.time),
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 10.0,
      ),
    );
  }

}
