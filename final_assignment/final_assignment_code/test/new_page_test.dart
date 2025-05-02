import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:untitled3/new_page.dart';  // Update the import if your project structure is different

void main() {
  testWidgets('NewPage renders and interacts properly', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      MaterialApp(
        home: NewPage(initialTabIndex: 0),
      ),
    );

    // Verify that the main texts are showing
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('user@example.com'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Activity'), findsOneWidget);
    expect(find.text('Reviews'), findsOneWidget);
    expect(find.text('Lists'), findsOneWidget);
    expect(find.text('Friends'), findsOneWidget);

    // Check that TabBar exists
    expect(find.byType(TabBar), findsOneWidget);

    // Tap on "Edit Profile" button
    await tester.tap(find.text('Edit Profile'));
    await tester.pumpAndSettle(); // wait for navigation

    // Since EditProfilePage is a placeholder, you might check that a new page has opened
    // You could add specific text inside EditProfilePage to check for that

    // Go back
    tester.binding.handlePopRoute();
    await tester.pumpAndSettle();

    // Tap on a bottom nav item (simulate moving to HomePage)
    await tester.tap(find.byType(BottomNavigationBar));
    await tester.pumpAndSettle();

    // (Optional) If your `MyHomePage` has specific text you can expect it here

  });
}
