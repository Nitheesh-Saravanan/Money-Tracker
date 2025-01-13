import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/main.dart';

void main() {
  testWidgets('Money Tracker App Test', (WidgetTester tester) async {
    // Step 1: Pump the main app widget
    await tester.pumpWidget(MoneyTrackerApp());

    // Verify the initial setup screen
    expect(find.text('Setup Income'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);

    // Step 2: Enter income and navigate to the main screen
    await tester.enterText(find.byType(TextField), '5000');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify the main screen is displayed
    expect(find.text('Money Tracker'), findsOneWidget);
    expect(find.text('Credit'), findsOneWidget);
    expect(find.text('Debit'), findsOneWidget);
    expect(find.text('Owed'), findsOneWidget);
    expect(find.text('Owed to You'), findsOneWidget);
    expect(find.text('Summary'), findsOneWidget);

    // Step 3: Navigate to the Credit screen
    await tester.tap(find.text('Credit'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify the Credit screen
    expect(find.text('Credit Transaction'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);

    // Step 4: Add a credit transaction and return to the main screen
    await tester.enterText(find.byType(TextField), '1000');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify back on the main screen
    expect(find.text('Money Tracker'), findsOneWidget);

    // Step 5: Navigate to the Summary screen
    await tester.tap(find.text('Summary'));
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify the summary values
    expect(find.text('Income: \$5000.00'), findsOneWidget);
    expect(find.text('Credit: \$1000.00'), findsOneWidget);
    expect(find.text('Debit: \$0.00'), findsOneWidget);
    expect(find.text('Remaining: \$6000.00'), findsOneWidget);
  });
}
