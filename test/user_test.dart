import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_project/models/user.dart'; // Update with the correct import path

void main() {
  group('UserModel', () {
    test('fromJson should correctly convert a map to a UserModel object', () {
      // Arrange
      final json = {
        'username': 'JohnDoe',
        'email': 'john@example.com',
        'photoUrl': 'http://example.com/photo.jpg',
        'country': 'USA',
        'bio': 'Software Developer',
        'id': 'user123',
        'signedUpAt': Timestamp.now(),
        'lastSeen': Timestamp.now(),
        'isOnline': true,
      };

      // Act
      final userModel = UserModel.fromJson(json);

      // Assert
      expect(userModel.username, 'JohnDoe');
      expect(userModel.email, 'john@example.com');
      expect(userModel.photoUrl, 'http://example.com/photo.jpg');
      expect(userModel.country, 'USA');
      expect(userModel.bio, 'Software Developer');
      expect(userModel.id, 'user123');
      expect(userModel.signedUpAt, isNotNull);
      expect(userModel.lastSeen, isNotNull);
      expect(userModel.isOnline, true);
    });

    test('toJson should correctly convert a UserModel object to a map', () {
      // Arrange
      final userModel = UserModel(
        username: 'JohnDoe',
        email: 'john@example.com',
        photoUrl: 'http://example.com/photo.jpg',
        country: 'USA',
        bio: 'Software Developer',
        id: 'user123',
        signedUpAt: Timestamp.now(),
        lastSeen: Timestamp.now(),
        isOnline: true,
      );

      // Act
      final json = userModel.toJson();

      // Assert
      expect(json['username'], 'JohnDoe');
      expect(json['email'], 'john@example.com');
      expect(json['photoUrl'], 'http://example.com/photo.jpg');
      expect(json['country'], 'USA');
      expect(json['bio'], 'Software Developer');
      expect(json['id'], 'user123');
      expect(json['signedUpAt'], isNotNull);
      expect(json['lastSeen'], isNotNull);
      expect(json['isOnline'], true);
    });

    test('fromJson should handle missing optional fields gracefully', () {
      // Arrange
      final json = {
        'username': 'JohnDoe',
        'email': 'john@example.com',
        'photoUrl': 'http://example.com/photo.jpg',
        'country': 'USA',
        // 'bio' is missing
        'id': 'user123',
        'signedUpAt': Timestamp.now(),
        'lastSeen': Timestamp.now(),
        'isOnline': true,
      };

      // Act
      final userModel = UserModel.fromJson(json);

      // Assert
      expect(userModel.username, 'JohnDoe');
      expect(userModel.email, 'john@example.com');
      expect(userModel.photoUrl, 'http://example.com/photo.jpg');
      expect(userModel.country, 'USA');
      expect(userModel.bio, isNull); // Bio is missing
      expect(userModel.id, 'user123');
      expect(userModel.signedUpAt, isNotNull);
      expect(userModel.lastSeen, isNotNull);
      expect(userModel.isOnline, true);
    });
  });
}
