import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_app/main.dart';

void main() {
  testWidgets('Should contain welcome message', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Welcome'), findsOneWidget);
  });

  testWidgets('Should enter and display name', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    String name = 'Vince';

    expect(find.text(name), findsNothing);

    await tester.enterText(find.byType(TextField), name);

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    expect(find.text(name), findsOneWidget);
  });

  testWidgets('Should clear name', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    String name = 'Vince';

    await tester.enterText(find.byType(TextField), name);

    await tester.tap(find.byType(ElevatedButton));

    await tester.pump();

    await tester.tap(find.byType(TextButton));

    await tester.pump();

    expect(find.text(name), findsNothing);
  });
}
