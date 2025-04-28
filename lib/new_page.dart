import 'package:flutter/material.dart';
import 'item.dart';
import 'edit_profile.dart';
class NewPage extends StatefulWidget {
  final int initialTabIndex;

  // Constructor to accept initialTabIndex as an argument
  NewPage({Key? key, required this.initialTabIndex}) : super(key: key);

  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  final List<String> albumImages = [
    'assets/grace.jpg',
    'assets/album1.jpg',
    'assets/album2.jpg',
    'assets/album3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    // Set the initial tab index from the widget's argument
    _tabController = TabController(length: 4, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToAlbumDetail(String albumImage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumDetailPage(imagePath: albumImage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/space.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 20,
                  bottom: 10,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/red.jpg'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      'user@example.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Spacer(),  // Pushes the button to the far right
                ElevatedButton(
                  onPressed: () {
                    // Add action for "Edit Profile" button
                    print('Edit Profile Pressed!');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Favorites'),
              Tab(text: 'Activity'),
              Tab(text: 'Reviews'),
              Tab(text: 'Lists'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Favorites Tab
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Favorite Singles',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      GridView.count(
                        crossAxisCount: 2, // 2 items per row
                        shrinkWrap: true, // Allows GridView to take the height of its children
                        physics: NeverScrollableScrollPhysics(), // Disables scroll for GridView
                        padding: EdgeInsets.all(8),
                        children: List.generate(10, (index) {
                          return Card(
                            elevation: 5,
                            margin: EdgeInsets.all(8),
                            child: InkWell(
                              onTap: () => _navigateToAlbumDetail('Album $index'),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/album_image.jpg', // Replace with actual album image path
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
                // Activity Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(albumImages.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () => _navigateToAlbumDetail(albumImages[index]),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  albumImages[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Album Title $index',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'This is a short review you wrote about the album.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Reviews Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(albumImages.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () => _navigateToAlbumDetail(albumImages[index]),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  albumImages[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Album Title $index',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'This is a short review of the album.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                // Lists Tab
                SingleChildScrollView(
                  child: Column(
                    children: List.generate(albumImages.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: InkWell(
                          onTap: () => _navigateToAlbumDetail(albumImages[index]),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  albumImages[index],
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Album Title $index',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'This is a short description of the album.',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ],
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

// The new page when you click an album
class AlbumDetailPage extends StatelessWidget {
  final String imagePath;

  const AlbumDetailPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Album Detail')),
      body: Center(
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}









