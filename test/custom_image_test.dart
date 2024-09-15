import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:new_project/components/custom_image.dart'; // Update with the correct import path

void main() {
  testWidgets('CustomImage renders with provided properties', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomImage(
            imageUrl: 'https://example.com/image.jpg',
            height: 150.0,
            width: 200.0,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );

    // Verify that the CachedNetworkImage widget is rendered
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Verify that CachedNetworkImage has the correct properties
    final cachedNetworkImage = tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedNetworkImage.imageUrl, 'https://example.com/image.jpg');
    expect(cachedNetworkImage.height, 150.0);
    expect(cachedNetworkImage.width, 200.0);
    expect(cachedNetworkImage.fit, BoxFit.contain);
  });

  testWidgets('CustomImage uses default properties when none are provided', (WidgetTester tester) async {
    // Build the widget with only the imageUrl provided
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomImage(
            imageUrl: 'https://example.com/image.jpg',
          ),
        ),
      ),
    );

    // Verify that the CachedNetworkImage widget is rendered
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Verify that default properties are used
    final cachedNetworkImage = tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedNetworkImage.imageUrl, 'https://example.com/image.jpg');
    expect(cachedNetworkImage.height, 100.0);
    expect(cachedNetworkImage.width, double.infinity);
    expect(cachedNetworkImage.fit, BoxFit.cover);
  });
}
