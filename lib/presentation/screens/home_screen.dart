import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News app'),
      ),
      body: PageView(children: []),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: 'Articles', icon: Icon(Icons.article_outlined)),
          BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite_border_outlined)),
        ],
      ),
    );
  }
}
