import 'package:flutter/material.dart';
import 'new_page.dart'; // Import your NewPage here

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, int tabIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewPage(initialTabIndex: tabIndex),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/space.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: () => _navigateTo(context, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/red.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'user@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () => _navigateTo(context, 0),
          ),
          ListTile(
            leading: const Icon(Icons.access_time),
            title: const Text('Activity'),
            onTap: () => _navigateTo(context, 1),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review),
            title: const Text('Reviews'),
            onTap: () => _navigateTo(context, 2),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Lists'),
            onTap: () => _navigateTo(context, 3),
          ),
        ],
      ),
    );
  }
}
