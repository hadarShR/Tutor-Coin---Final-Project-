import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/status.dart'; // Update with the correct import path
import 'package:new_project/models/enum/message_type.dart'; // Update with the correct import path

void main() {
  group('StatusModel', () {
    test('fromJson should correctly convert JSON to StatusModel object', () {
      // Arrange
      final json = {
        'caption': 'Test Caption',
        'url': 'http://example.com/image.png',
        'statusId': 'status123',
        'viewers': ['user1', 'user2'],
        'type': 'text',
        'time': Timestamp.now(),
      };

      // Act
      final statusModel = StatusModel.fromJson(json);

      // Assert
      expect(statusModel.caption, 'Test Caption');
      expect(statusModel.url, 'http://example.com/image.png');
      expect(statusModel.statusId, 'status123');
      expect(statusModel.viewers, ['user1', 'user2']);
      expect(statusModel.type, MessageType.TEXT);
      expect(statusModel.time, isNotNull);
    });

    test('toJson should correctly convert StatusModel object to JSON', () {
      // Arrange
      final statusModel = StatusModel(
        caption: 'Test Caption',
        url: 'http://example.com/image.png',
        statusId: 'status123',
        viewers: ['user1', 'user2'],
        type: MessageType.TEXT,
        time: Timestamp.now(),
      );

      // Act
      final json = statusModel.toJson();

      // Assert
      expect(json['caption'], 'Test Caption');
      expect(json['url'], 'http://example.com/image.png');
      expect(json['statusId'], 'status123');
      expect(json['viewers'], ['user1', 'user2']);
      expect(json['type'], 'text');
      expect(json['time'], isNotNull);
    });

    test('toJson should handle missing optional fields correctly', ()
    {
      // Arrange
      final statusModel = StatusModel(
        caption: 'Test Caption',
        url: 'http://example.com/image.png',
      );

      // Act
      final json = statusModel.toJson();

      // Assert
      expect(json['caption'], 'Test Caption');
      expect(json['url'], 'http://example.com/image.png');
    });



  });
}