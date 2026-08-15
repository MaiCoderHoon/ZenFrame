import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:palette_snap/main.dart';

void main() {
  testWidgets('PaletteSnap navigation smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify that the title 'PaletteSnap' is displayed.
    expect(find.text('PaletteSnap'), findsWidgets);

    // Verify that we start on the Home screen and the Go Pro button is present.
    expect(find.text('Go Pro'), findsOneWidget);

    // Tap on the 'Go Pro' button to open the Paywall Screen.
    await tester.tap(find.text('Go Pro'));
    // Wait for route transition animation to finish
    await tester.pumpAndSettle();

    // Verify that the Paywall Screen is displayed by finding the title
    expect(find.text('PaletteSnap Pro'), findsOneWidget);

    // Close the Paywall using the close icon
    await tester.tap(find.byIcon(Icons.close));
    await tester.pumpAndSettle();

    // Verify we are back on the Home screen
    expect(find.text('Go Pro'), findsOneWidget);
  });
}
