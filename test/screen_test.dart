
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dart_flutter_assignment/main.dart';
import 'package:dart_flutter_assignment/meals_screen.dart';
import 'package:dart_flutter_assignment/snacks_screen.dart';
void main() {
  testWidgets('Test BottomNavigationBar navigation', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Pick your drink:'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.fastfood));
    await tester.pumpAndSettle();
    expect(find.byType(MealsScreen), findsOneWidget);
    await tester.tap(find.byIcon(Icons.cookie));
    await tester.pumpAndSettle();
    expect(find.byType(SnacksScreen), findsOneWidget);
  });

  testWidgets('Test DrinkListScreen widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('WELCOME!'), findsOneWidget);
    expect(find.text('Pick your drink:'), findsOneWidget);

    expect(find.text('Soda'), findsOneWidget);
    expect(find.text('Juice'), findsOneWidget);
    expect(find.text('Energy Drink'), findsOneWidget);
  });

  testWidgets('Test MealsScreen widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen()));

    expect(find.text('WELCOME TO MEALS!'), findsOneWidget);
    expect(find.text('Pick your meal:'), findsOneWidget);

    expect(find.text('Breakfast'), findsOneWidget);
    expect(find.text('Lunch'), findsOneWidget);
    expect(find.text('Dinner'), findsOneWidget);
  });
  testWidgets('Test SnacksScreen widgets', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SnacksScreen()));

    expect(find.text('SNACK TIME!'), findsOneWidget);
    expect(find.text('Pick your snack:'), findsOneWidget);

    expect(find.text('Chips'), findsOneWidget);
    expect(find.text('Candy'), findsOneWidget);
    expect(find.text('Cookies'), findsOneWidget);
  });

  testWidgets('Test SnacksScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await tester.tap(find.byIcon(Icons.cookie));
    await tester.pumpAndSettle();

    expect(find.byType(SnacksScreen), findsOneWidget);
  });

  testWidgets('Test drink categories in DrinkListScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Soda'), findsOneWidget);

    await tester.tap(find.text('Soda'));
    await tester.pumpAndSettle();
    expect(find.text('Coca-Cola'), findsOneWidget);
  });

  testWidgets('Test meal categories in MealsScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MealsScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Breakfast'), findsOneWidget);
    expect(find.text('Lunch'), findsOneWidget);
    expect(find.text('Dinner'), findsOneWidget);

    await tester.tap(find.text('Breakfast'));
    await tester.pumpAndSettle();

    expect(find.text('Pancakes'), findsOneWidget);

  });

  testWidgets('Test meal categories in SnacksScreen', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SnacksScreen()));

    await tester.pumpAndSettle();

    expect(find.text('Chips'), findsOneWidget);
    expect(find.text('Candy'), findsOneWidget);
    expect(find.text('Cookies'), findsOneWidget);

    await tester.tap(find.text('Chips'));
    await tester.pumpAndSettle();

    expect(find.text('Lays'), findsOneWidget);

  });

}
