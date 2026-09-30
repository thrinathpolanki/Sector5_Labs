import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_lab/main.dart';

void main() {
  testWidgets(
    'Counter starts at zero and increments when button is tapped',
    (WidgetTester tester) async {
      // Build the application.
      await tester.pumpWidget(const MyApp());

      // Verify that the title is displayed.
      expect(find.text('Counter Value'), findsOneWidget);

      // Verify the initial counter value.
      expect(find.text('0'), findsOneWidget);

      // Verify that the Increment button exists.
      expect(
        find.byKey(const Key('incrementButton')),
        findsOneWidget,
      );

      // Tap the Increment button.
      await tester.tap(
        find.byKey(const Key('incrementButton')),
      );

      // Rebuild the widget after the interaction.
      await tester.pump();

      // Verify that the counter changed from 0 to 1.
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    },
  );
}
