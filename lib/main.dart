import 'package:flutter/material.dart';
import 'new_page.dart';  // Import the new page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Review App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Custom Drawer Header with image and icon
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/space.jpg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the NewPage when the DrawerHeader is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewPage(initialTabIndex: 0), // Navigate with the 'Reviews' tab highlighted
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // User icon
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/red.jpg'), // Replace with your user icon
                    ),
                    SizedBox(height: 10), // Space between icon and text
                    // Username text
                    Text(
                      'Username', // Replace with dynamic username if needed
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Text color
                      ),
                    ),
                    // Additional text (email or other info)
                    Text(
                      'user@example.com', // Replace with dynamic email if needed
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Drawer Items
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Profile'),
              onTap: () {
                // Navigate to the NewPage when the DrawerHeader is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 0), // Navigate with the 'Reviews' tab highlighted
                  ),
                );
              }
            ),
            ListTile(
              title: Text('Activity'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 1), // Navigate with the 'Reviews' tab highlighted
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Reviews'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 2), // Navigate with the 'Reviews' tab highlighted
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Lists'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPage(initialTabIndex: 3), // Navigate with the 'Reviews' tab highlighted
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Selected Index: $_selectedIndex',
          style: TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

