import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/utils/validation.dart';
import 'package:new_project/utils/validation.dart'; // Replace with the actual path to your Validations class

void main() {
  group('Validations Tests', () {
    test('validateName returns error for empty input', () {
      expect(Validations.validateName(''), 'Username is Required.');
    });

    test('validateName returns error for invalid characters', () {
      expect(Validations.validateName('User123'), 'Please enter only alphabetical characters.');
    });

    test('validateName returns null for valid input', () {
      expect(Validations.validateName('Valid Name'), null);
    });

    test('validateEmail returns error for empty input when required', () {
      expect(Validations.validateEmail('', true), 'Email is required.');
    });

    test('validateEmail returns null for empty input when not required', () {
      expect(Validations.validateEmail('', false), null);
    });

    test('validateEmail returns error for invalid email', () {
      expect(Validations.validateEmail('invalidemail', true), 'Invalid email address');
    });

    test('validateEmail returns null for valid email', () {
      expect(Validations.validateEmail('valid.email@example.com'), null);
    });

    test('validatePassword returns error for empty password', () {
      expect(Validations.validatePassword(''), 'Please enter a valid password.');
    });

    test('validatePassword returns error for short password', () {
      expect(Validations.validatePassword('short'), 'Please enter a valid password.');
    });

    test('validatePassword returns null for valid password', () {
      expect(Validations.validatePassword('validPassword123'), null);
    });
  });
}
