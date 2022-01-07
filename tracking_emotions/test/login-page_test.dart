import 'package:flutter_test/flutter_test.dart';
import 'package:tracking_emotions/main.dart';

void main() {
  testWidgets('Check that the app have the login screen as first page',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('LOGIN'), findsNWidgets(2));
  });
}
