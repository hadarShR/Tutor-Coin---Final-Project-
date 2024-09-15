import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/models/register.dart'; // Update with the correct import path

void main() {
  group('Register', () {
    test('toJson should correctly convert Register object to JSON', () {
      // Arrange
      final register = Register()
        ..username = 'JohnDoe'
        ..email = 'john.doe@example.com'
        ..gender = 'Male'
        ..country = 'USA'
        ..password = 'password123'
        ..passwordConfirmation = 'password123'
        ..publicEmail = true;

      // Act
      final json = register.toJson();

      // Assert
      expect(json['name'], 'JohnDoe');
      expect(json['email'], 'john.doe@example.com');
      expect(json['gender'], 'Male');
      expect(json['password'], 'password123');
      expect(json['password_confirmation'], 'password123');
      expect(json['public_email'], true);
    });

    test('toJson should handle missing optional fields correctly', () {
      // Arrange
      final register = Register()
        ..username = 'JaneDoe'
        ..email = 'jane.doe@example.com'
        ..gender = 'Female';

      // Act
      final json = register.toJson();

      // Assert
      expect(json['name'], 'JaneDoe');
      expect(json['email'], 'jane.doe@example.com');
      expect(json['gender'], 'Female');
      expect(json['password'], null);
      expect(json['password_confirmation'], null);
      expect(json['public_email'], false); // Default value
    });
  });
}
