import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../lib/utils/file_utils.dart'; // Adjust the import path as necessary

class MockFile extends Mock implements File {}

void main() {
  late MockFile mockFile;

  setUp(() {
    mockFile = MockFile();
  });

  group('FileUtils', () {

    test('formatBytes returns correct human-readable file size', () {
      String formattedSize = FileUtils.formatBytes(5242880, 2); // 5 MB in bytes

      expect(formattedSize, '5.00 MB');
    });

    test('formatBytes returns 0.0 KB for zero bytes', () {
      String formattedSize = FileUtils.formatBytes(0, 2);

      expect(formattedSize, '0.0 KB');
    });
  });
}
