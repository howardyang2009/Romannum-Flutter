// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:romannum_flutter/main.dart';

void main() {
  testWidgets('Romannum Calculator I+II=III', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // input 2 Roman number.
    await tester.enterText(find.byKey(const Key('num1')), 'I');
    await tester.enterText(find.byKey(const Key('num2')), 'II');

    // Tap the 'Calculator' button and trigger a frame.
    var button = find.widgetWithText(ElevatedButton, 'Calculate');
    await tester.ensureVisible(button);
    //await tester.pumpAndSettle();

    await tester.tap(button);
    await tester.pump();

    // Verify the sum is correct
    expect(find.text('III'), findsOneWidget);
  });
}
