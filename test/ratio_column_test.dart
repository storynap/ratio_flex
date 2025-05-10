import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ratio_flex/ratio_flex.dart';

void main() {
  group('RatioColumn Widget Tests', () {
    testWidgets('RatioColumn renders correctly with 3 children and default flexFit', (WidgetTester tester) async {
      // Create test widgets with different background colors
      final widgets = [
        Container(key: const Key('container1'), color: Colors.red),
        Container(key: const Key('container2'), color: Colors.green),
        Container(key: const Key('container3'), color: Colors.blue),
      ];

      // Build our widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 300,
              child: RatioColumn(
                children: widgets,
                flexes: [1, 2, 1],
              ),
            ),
          ),
        ),
      );

      // Verify the widget render
      expect(find.byType(RatioColumn), findsOneWidget);
      expect(find.byType(Flex), findsOneWidget);
      expect(find.byType(Flexible), findsNWidgets(3));
      expect(find.byType(Container), findsNWidgets(3));

      // Find the Flexible widgets
      final flexibles = tester.widgetList<Flexible>(find.byType(Flexible)).toList();

      // Check flex values are correctly applied
      expect(flexibles[0].flex, equals(1));
      expect(flexibles[1].flex, equals(2));
      expect(flexibles[2].flex, equals(1));

      // By default flexFit should be tight (equivalent to Expanded)
      expect(flexibles[0].fit, equals(FlexFit.tight));
      expect(flexibles[1].fit, equals(FlexFit.tight));
      expect(flexibles[2].fit, equals(FlexFit.tight));
    });

    testWidgets('RatioColumn uses default flex value of 1 when flexes is not provided', (WidgetTester tester) async {
      // Create test widgets with different background colors
      final widgets = [
        Container(key: const Key('container1'), color: Colors.red),
        Container(key: const Key('container2'), color: Colors.green),
        Container(key: const Key('container3'), color: Colors.blue),
      ];

      // Build our widget without providing flexes
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 300,
              child: RatioColumn(
                children: widgets,
                // No flexes provided
              ),
            ),
          ),
        ),
      );

      // Find the Flexible widgets
      final flexibles = tester.widgetList<Flexible>(find.byType(Flexible)).toList();

      // Check all flex values are 1
      expect(flexibles[0].flex, equals(1));
      expect(flexibles[1].flex, equals(1));
      expect(flexibles[2].flex, equals(1));
    });

    testWidgets('RatioColumn uses FlexFit.loose when specified', (WidgetTester tester) async {
      // Create test widgets
      final widgets = [
        Container(key: const Key('container1'), color: Colors.red),
        Container(key: const Key('container2'), color: Colors.blue),
      ];

      // Build our widget with FlexFit.loose
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 300,
              child: RatioColumn(
                children: widgets,
                flexes: [3, 1],
                flexFit: FlexFit.loose,
              ),
            ),
          ),
        ),
      );

      // Find the Flexible widgets
      final flexibles = tester.widgetList<Flexible>(find.byType(Flexible)).toList();

      // Check flex values
      expect(flexibles[0].flex, equals(3));
      expect(flexibles[1].flex, equals(1));

      // Check all are using FlexFit.loose
      expect(flexibles[0].fit, equals(FlexFit.loose));
      expect(flexibles[1].fit, equals(FlexFit.loose));
    });

    testWidgets('RatioColumn throws assertion error when children and flexes have different lengths',
        (WidgetTester tester) async {
      expect(
          () => RatioColumn(
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                ],
                flexes: [1, 2, 3], // One more flex than child
              ),
          throwsAssertionError);
    });

    testWidgets('RatioColumn handles optional Column properties', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 300,
              child: RatioColumn(
                children: [
                  Container(color: Colors.red),
                  Container(color: Colors.blue),
                ],
                flexes: [1, 1],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
        ),
      );

      // Find the Column
      final column = tester.widget<Flex>(find.byType(Flex));

      // Check Column properties are correctly passed
      expect(column.direction, Axis.vertical);
      expect(column.mainAxisAlignment, equals(MainAxisAlignment.spaceEvenly));
      expect(column.crossAxisAlignment, equals(CrossAxisAlignment.end));
      expect(column.mainAxisSize, equals(MainAxisSize.min));
    });

    testWidgets('RatioColumn works with single child', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 100,
              height: 300,
              child: RatioColumn(
                children: [Container(color: Colors.red)],
                flexes: [1],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(Flexible), findsOneWidget);
      final flexible = tester.widget<Flexible>(find.byType(Flexible));
      expect(flexible.flex, equals(1));
      expect(flexible.fit, equals(FlexFit.tight));
    });
  });
}
