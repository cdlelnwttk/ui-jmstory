import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled3/main.dart'; // Adjust if your app name or folder is different
import 'package:untitled3/new_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('MyHomePage Widget Tests', () {
    testWidgets('App starts and shows Music Review App title', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Music Review App'), findsOneWidget);
    });

    testWidgets('Drawer opens and navigates by tapping username', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Open the drawer
      ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      // Tap the username inside the DrawerHeader
      await tester.tap(find.text('Username'));
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('Drawer navigation: Profile tap', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Profile'));
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('Drawer navigation: Activity tap', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Activity'));
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('Drawer navigation: Reviews tap', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Reviews'));
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('Drawer navigation: Lists tap', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      ScaffoldState scaffoldState = tester.firstState(find.byType(Scaffold));
      scaffoldState.openDrawer();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Lists'));
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('Bottom navigation changes selected index', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.text('Selected Index: 0'), findsNothing);

      // Tap on bottom navigation bar item with index 1
      await tester.tap(find.byIcon(Icons.search));
      await tester.pumpAndSettle();

      // Should show the text for selected index
      expect(find.text('Selected Index: 1'), findsOneWidget);
    });

    testWidgets('Bottom navigation taps profile and navigates to NewPage', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Tap on profile tab (index 4)
      await tester.tap(find.byIcon(Icons.person)); // assuming 4th tab is Icon(Icons.person)
      await tester.pumpAndSettle();

      expect(find.byType(NewPage), findsOneWidget);
    });

    testWidgets('TabBar switches between tabs', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      // Initially should find "Featured Reviews" tab
      expect(find.text('Featured Reviews'), findsOneWidget);

      // Tap "Friend's Reviews" tab
      await tester.tap(find.text('Friend\'s Reviews'));
      await tester.pumpAndSettle();

      // Should still be on FeedList view
      expect(find.byType(DefaultTabController), findsOneWidget);
    });
  });
}

