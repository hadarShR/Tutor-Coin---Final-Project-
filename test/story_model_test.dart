import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/status.dart';
import 'package:new_project/models/story_model.dart'; // Update with the correct import path

void main() {
  group('Status', () {
    test('fromMap should correctly convert map to Status object', () {
      // Arrange
      final map = {
        'uid': 'user123',
        'username': 'John Doe',
        'description': ['First status', 'Second status'],
        'photoUrl': ['http://example.com/photo1.png', 'http://example.com/photo2.png'],
        'createdAt': Timestamp.now(),
        'profilePic': 'http://example.com/profile.png',
        'statusId': 'status123',
        'whoCanSee': ['user1', 'user2'],
      };

      // Act
      final status = Status.fromMap(map);

      // Assert
      expect(status.uid, 'user123');
      expect(status.username, 'John Doe');
      expect(status.description, ['First status', 'Second status']);
      expect(status.photoUrl, ['http://example.com/photo1.png', 'http://example.com/photo2.png']);
      expect(status.createdAt, isNotNull);
      expect(status.profilePic, 'http://example.com/profile.png');
      expect(status.statusId, 'status123');
      expect(status.whoCanSee, ['user1', 'user2']);
    });

    test('toMap should correctly convert Status object to map', () {
      // Arrange
      final status = Status(
        uid: 'user123',
        username: 'John Doe',
        photoUrl: ['http://example.com/photo1.png', 'http://example.com/photo2.png'],
        description: ['First status', 'Second status'],
        createdAt: Timestamp.now(),
        profilePic: 'http://example.com/profile.png',
        statusId: 'status123',
        whoCanSee: ['user1', 'user2'],
      );

      // Act
      final map = status.toMap();

      // Assert
      expect(map['uid'], 'user123');
      expect(map['username'], 'John Doe');
      expect(map['description'], ['First status', 'Second status']);
      expect(map['photoUrl'], ['http://example.com/photo1.png', 'http://example.com/photo2.png']);
      expect(map['profilePic'], 'http://example.com/profile.png');
      expect(map['statusId'], 'status123');
      expect(map['whoCanSee'], ['user1', 'user2']);
      // Timestamp comparison might be tricky if the value is generated dynamically, so we skip this assertion or check if it's not null
      expect(map['createdAt'], isNotNull);
    });

  });
}
