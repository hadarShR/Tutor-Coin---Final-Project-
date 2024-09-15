import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/notification.dart'; // Update with the correct import path

void main() {
  group('ActivityModel', () {
    test('fromJson should correctly convert JSON to ActivityModel object', () {
      // Arrange
      final Map<String, dynamic> json = {
        'type': 'post',
        'username': 'Jane Doe',
        'userId': 'user123',
        'userDp': 'http://example.com/profile.jpg',
        'postId': 'post123',
        'mediaUrl': 'http://example.com/media.jpg',
        'commentData': 'This is a comment',
        'timestamp': Timestamp.now(),
      };

      // Act
      final activity = ActivityModel.fromJson(json);

      // Assert
      expect(activity.type, 'post');
      expect(activity.username, 'Jane Doe');
      expect(activity.userId, 'user123');
      expect(activity.userDp, 'http://example.com/profile.jpg');
      expect(activity.postId, 'post123');
      expect(activity.mediaUrl, 'http://example.com/media.jpg');
      expect(activity.commentData, 'This is a comment');
      expect(activity.timestamp, isNotNull); // Checking that the timestamp is not null
    });

    test('toJson should correctly convert ActivityModel object to JSON', () {
      // Arrange
      final activity = ActivityModel(
        'post',
        'Jane Doe',
        'user123',
        'http://example.com/profile.jpg',
        'post123',
        'This is a comment',
        'http://example.com/media.jpg',
        Timestamp.now(),
      );

      // Act
      final json = activity.toJson();

      // Assert
      expect(json['type'], 'post');
      expect(json['username'], 'Jane Doe');
      expect(json['userId'], 'user123');
      expect(json['userDp'], 'http://example.com/profile.jpg');
      expect(json['postId'], 'post123');
      expect(json['mediaUrl'], 'http://example.com/media.jpg');
      expect(json['commentData'], 'This is a comment');
      expect(json['timestamp'], isNotNull); // Checking that the timestamp is not null
    });
  });
}
