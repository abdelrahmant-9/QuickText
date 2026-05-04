import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quicktext/main.dart';

void main() {
  testWidgets('QuickText UI and submission test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const QuickTextApp());

    // Verify initial state: "No data entered yet." should be visible.
    expect(find.text('No data entered yet.'), findsOneWidget);

    // Enter text into the TextField.
    await tester.enterText(find.byType(TextField), 'Hello Flutter');
    
    // Tap the 'Submit' button.
    await tester.tap(find.text('Submit'));
    await tester.pump(); // Trigger a frame to update the UI.

    // Verify that the text is displayed in the list.
    expect(find.text('Hello Flutter'), findsOneWidget);
    // The placeholder should be gone.
    expect(find.text('No data entered yet.'), findsNothing);

    // Tap the delete button (IconButton).
    await tester.tap(find.byIcon(Icons.delete_outline_rounded));
    await tester.pump();

    // Verify that the text is gone and placeholder is back.
    expect(find.text('Hello Flutter'), findsNothing);
    expect(find.text('No data entered yet.'), findsOneWidget);
  });
}
