import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/comments.dart'; // Update with the correct import path

void main() {
  group('CommentModel', () {
    test('fromJson should correctly convert JSON to CommentModel object', () {
      // Arrange
      final Map<String, dynamic> json = {
        'username': 'Jane Doe',
        'comment': 'Great post!',
        'timestamp': Timestamp.now(),
        'userDp': 'http://example.com/profile.jpg',
        'userId': 'user123',
      };

      // Act
      final comment = CommentModel.fromJson(json);

      // Assert
      expect(comment.username, 'Jane Doe');
      expect(comment.comment, 'Great post!');
      expect(comment.timestamp, isNotNull); // Check if timestamp is not null
      expect(comment.userDp, 'http://example.com/profile.jpg');
      expect(comment.userId, 'user123');
    });

    test('toJson should correctly convert CommentModel object to JSON', () {
      // Arrange
      final comment = CommentModel(
        username: 'Jane Doe',
        comment: 'Great post!',
        timestamp: Timestamp.now(),
        userDp: 'http://example.com/profile.jpg',
        userId: 'user123',
      );

      // Act
      final json = comment.toJson();

      // Assert
      expect(json['username'], 'Jane Doe');
      expect(json['comment'], 'Great post!');
      expect(json['timestamp'], isNotNull); // Check if timestamp is not null
      expect(json['userDp'], 'http://example.com/profile.jpg');
      expect(json['userId'], 'user123');
    });
  });
}
