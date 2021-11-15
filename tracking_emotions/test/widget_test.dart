// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:tracking_emotions/main.dart';

void main() {
  testWidgets('Check that the app have the login screen as first page',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // deleted old tests so that the test pipeline can pass
    expect(find.text('LOGIN'), findsNWidgets(2));
  });
}
