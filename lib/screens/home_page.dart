import 'package:flutter/material.dart';
import 'package:spotify/screens/favorite_page.dart';
import 'package:spotify/screens/overview_page.dart';
import 'package:spotify/screens/search_page.dart';
import 'package:spotify/screens/user_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static const Gradient gradient = LinearGradient(colors: [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.deepPurple,
    Colors.deepPurple,
    Colors.indigo,
    Colors.blue,
    Colors.lightBlue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lightGreen,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.deepOrange,
  ]);
  List<Widget> pages = const <Widget>[OverViewPage(), SearchPage(), FavoritePage(), UserPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.grey.shade300,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentIndex,
        onDestinationSelected: (value) => setState(() {
          _currentIndex = value;
        }),
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              label: 'Home',
              selectedIcon: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => gradient.createShader(
                        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                      ),
                  child: const Icon(Icons.home))),
          NavigationDestination(
            icon: const Icon(Icons.search_outlined),
            label: 'Search',
            selectedIcon: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => gradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: const Icon(Icons.search)),
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite_border),
            label: 'Favorite',
            selectedIcon: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => gradient.createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    ),
                child: const Icon(Icons.favorite)),
          ),
          NavigationDestination(
            icon: Container(
                height: 30,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: const CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/images/cover.jpg'))),
            label: 'User',
          )
        ],
      ),
    );
  }
}
