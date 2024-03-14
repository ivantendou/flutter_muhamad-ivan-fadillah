import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        backgroundColor: const Color(0xFF00A8E8),
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Text('Fitur masih dalam tahap pengembangan'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_rounded),
            label: 'Information',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: const Color(0xFF00A8E8),
      ),
    );
  }
}
