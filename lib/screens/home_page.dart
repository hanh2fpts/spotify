import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.grey[300],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
        }),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined), label: 'Home', selectedIcon: Icon(Icons.home)),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            label: 'Search',
            selectedIcon: Icon(Icons.search),
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Favorite',
            selectedIcon: Icon(Icons.favorite),
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'User',
            selectedIcon: Icon(Icons.person),
          )
        ],
      ),
    );
  }
}
