import 'package:flutter/material.dart';
import 'charts.dart';
import 'new_page.dart';
import 'search.dart';
import 'main.dart';
import 'review.dart';
void handleNavTap(BuildContext context, int index) {
  if (index == 4) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage(initialTabIndex: 0)),
      );
  } else if (index == 3) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ChartsPage()),
    );
  } else if (index == 2) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchWidgetPage()), // Adjust as needed
    );
  } else if (index == 1) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
  } else if (index == 0) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHomePage()),
    );
  }
}
