import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/message.dart'; // Update with the correct import path
import 'package:new_project/models/enum/message_type.dart'; // Update with the correct import path

void main() {
  group('Message class', () {
    test('fromJson should correctly convert JSON to Message object', () {
      // Arrange
      final Map<String, dynamic> json = {
        'content': 'Hello, world!',
        'senderUid': 'user123',
        'messageId': 'msg123',
        'type': 'text',
        'time': Timestamp.now(),
      };

      // Act
      final message = Message.fromJson(json);

      // Assert
      expect(message.content, 'Hello, world!');
      expect(message.senderUid, 'user123');
      expect(message.messageId, 'msg123');
      expect(message.type, MessageType.TEXT);
      expect(message.time, isNotNull); // Checking that the timestamp is not null
    });

    test('toJson should correctly convert Message object to JSON', () {
      // Arrange
      final message = Message(
        content: 'Hello, world!',
        senderUid: 'user123',
        messageId: 'msg123',
        type: MessageType.TEXT,
        time: Timestamp.now(),
      );

      // Act
      final json = message.toJson();

      // Assert
      expect(json['content'], 'Hello, world!');
      expect(json['senderUid'], 'user123');
      expect(json['messageId'], 'msg123');
      expect(json['type'], 'text');
      expect(json['time'], isNotNull); // Checking that the timestamp is not null
    });
  });
}
