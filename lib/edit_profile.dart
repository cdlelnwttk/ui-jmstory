import 'package:flutter/material.dart';
import 'drawer.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

final List<String> albumImages = [
  'assets/grace.jpg',
  'assets/goo.jpg',
  'assets/mellon.jpg',
  'assets/youdpreferanastronaut.png',
];

final List<String> singleImages = [
  'assets/single1.jpg', // Replace with your own images
  'assets/single2.jpg',
  'assets/single3.jpg',
  'assets/single4.jpg',
];

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _displayNameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _displayNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cover Image with Circular Profile on top
              Stack(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/space.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115, // Adjust this value to control vertical positioning
                    left: 16, // Adjust this value for horizontal positioning
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/red.jpg'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Display Name
              TextField(
                controller: _displayNameController,
                decoration: InputDecoration(
                  labelText: 'New Display Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),

              // Favorite Albums Section
              Text(
                'Favorite Singles',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Wrap to create two rows of images for albums
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ImageWidget(
                        imageUrl: albumImages[index],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ImageWidget(
                        imageUrl: albumImages[index + 2],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),

              // Favorite Singles Section
              Text(
                'Favorite Albums',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Wrap to create two rows of images for singles
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ImageWidget(
                        imageUrl: albumImages[index],
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(2, (index) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ImageWidget(
                        imageUrl: albumImages[index + 2],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  final String imageUrl;

  const ImageWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageUrl,
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
}



