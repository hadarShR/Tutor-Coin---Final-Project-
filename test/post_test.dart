import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/post.dart'; // Update with the correct import path

void main() {
  group('PostModel', () {
    test('fromJson should correctly convert JSON to PostModel object', () {
      // Arrange
      final Map<String, dynamic> json = {
        'id': '1',
        'postId': 'post123',
        'ownerId': 'user123',
        'username': 'Jane Doe',
        'location': 'New York',
        'description': 'A beautiful sunset',
        'mediaUrl': 'http://example.com/sunset.jpg',
        'timestamp': Timestamp.now(),
      };

      // Act
      final post = PostModel.fromJson(json);

      // Assert
      expect(post.id, '1');
      expect(post.postId, 'post123');
      expect(post.ownerId, 'user123');
      expect(post.username, 'Jane Doe');
      expect(post.location, 'New York');
      expect(post.description, 'A beautiful sunset');
      expect(post.mediaUrl, 'http://example.com/sunset.jpg');
      expect(post.timestamp, isNotNull); // Check if timestamp is not null
    });

    test('toJson should correctly convert PostModel object to JSON', () {
      // Arrange
      final post = PostModel(
        id: '1',
        postId: 'post123',
        ownerId: 'user123',
        username: 'Jane Doe',
        location: 'New York',
        description: 'A beautiful sunset',
        mediaUrl: 'http://example.com/sunset.jpg',
        timestamp: Timestamp.now(),
      );

      // Act
      final json = post.toJson();

      // Assert
      expect(json['id'], '1');
      expect(json['postId'], 'post123');
      expect(json['ownerId'], 'user123');
      expect(json['username'], 'Jane Doe');
      expect(json['location'], 'New York');
      expect(json['description'], 'A beautiful sunset');
      expect(json['mediaUrl'], 'http://example.com/sunset.jpg');
      expect(json['timestamp'], isNotNull); // Check if timestamp is not null
    });
  });
}
