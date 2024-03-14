import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  final List<String> Courses = [
    'Flutter',
    'Dart',
    'Android',
    'iOS',
    'Web',
    'Dekstop',
    'Embedded',
    'Cloud',
    'AI',
    'IoT',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta - Widget Layout - Exploration'),
        centerTitle: true,
        backgroundColor: const Color(0xFF00A8E8),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: Courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.laptop),
            iconColor: Colors.blue[700],
            textColor: Colors.blue[700],
            title: Text('Learn ${Courses[index]}'),
            trailing: const Icon(Icons.arrow_forward),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFA8E800),
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
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
        selectedItemColor: const Color(0xFF00A8E8),
      ),
    );
  }
}
