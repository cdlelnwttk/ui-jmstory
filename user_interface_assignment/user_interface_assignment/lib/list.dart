import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final List<String> items = [
    'Album 1',
    'Album 2',
    'Album 3',
    'Album 4',
    'Album 5',
  ];

  void _navigateToItemDetail(BuildContext context, String itemName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailPage(itemName: itemName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              _navigateToItemDetail(context, items[index]);
            },
          );
        },
      ),
    );
  }
}

class ItemDetailPage extends StatelessWidget {
  final String itemName;

  const ItemDetailPage({required this.itemName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Details of $itemName',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
