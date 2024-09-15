import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:new_project/auth/register/profile_pic.dart';
import 'package:new_project/view_models/auth/posts_view_model.dart';

void main() {
  group('ProfilePicture Widget Tests', () {
    test('initial state of viewModel', () {
      final viewModel = PostsViewModel();

      // Check initial values of the viewModel
      expect(viewModel.loading, false);
      expect(viewModel.imgLink, isNull);
      expect(viewModel.mediaUrl, isNull);
    });

    testWidgets('ProfilePicture widget interactions', (WidgetTester tester) async {
      final viewModel = PostsViewModel();

      await tester.pumpWidget(
        ChangeNotifierProvider<PostsViewModel>(
          create: (_) => viewModel,
          child: MaterialApp(
            home: ProfilePicture(),
          ),
        ),
      );

      // Simulate tapping on the image area to show the bottom sheet
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle(); // Wait for the bottom sheet to settle

      // Check that the bottom sheet options are displayed
      expect(find.text('SELECT FROM'), findsOneWidget);
    });

    testWidgets('ProfilePicture widget interactions', (WidgetTester tester) async {
      final viewModel = PostsViewModel();

      await tester.pumpWidget(
        ChangeNotifierProvider<PostsViewModel>(
          create: (_) => viewModel,
          child: MaterialApp(
            home: ProfilePicture(),
          ),
        ),
      );

      // Simulate tapping on the image area to show the bottom sheet
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle(); // Wait for the bottom sheet to settle

      // Check that the bottom sheet options are displayed
      expect(find.text('Camera'), findsOneWidget);
    });

    testWidgets('ProfilePicture widget interactions', (WidgetTester tester) async {
      final viewModel = PostsViewModel();

      await tester.pumpWidget(
        ChangeNotifierProvider<PostsViewModel>(
          create: (_) => viewModel,
          child: MaterialApp(
            home: ProfilePicture(),
          ),
        ),
      );

      // Simulate tapping on the image area to show the bottom sheet
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle(); // Wait for the bottom sheet to settle

      // Check that the bottom sheet options are displayed
      expect(find.text('Gallery'), findsOneWidget);
    });

    testWidgets('ProfilePicture widget text styling', (WidgetTester tester) async {
      final viewModel = PostsViewModel();

      await tester.pumpWidget(
        ChangeNotifierProvider<PostsViewModel>(
          create: (_) => viewModel,
          child: MaterialApp(
            home: ProfilePicture(),
          ),
        ),
      );

      // Check text style of the placeholder text
      final textFinder = find.text('Tap to add your profile picture');
      final textWidget = tester.widget<Text>(textFinder);
      final textStyle = textWidget.style;

      expect(textStyle?.color, Theme.of(tester.element(find.byType(ProfilePicture))).colorScheme.secondary); // Text color
    });





  });
}
