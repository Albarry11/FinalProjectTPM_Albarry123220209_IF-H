import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:final_project/main.dart';

void main() {
  testWidgets('Step counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa awalnya langkah adalah 0
    expect(find.text('Steps Taken: 0'), findsOneWidget);
    expect(find.text('Steps Taken: 1'), findsNothing);

    // Simulasikan langkah
    await tester.tap(find.byIcon(Icons.directions_walk));
    await tester.pump();

    // Verifikasi bahwa langkah bertambah
    expect(find.text('Steps Taken: 1'), findsOneWidget);
  });
}
