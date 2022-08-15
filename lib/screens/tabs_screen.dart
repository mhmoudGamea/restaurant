import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import '../models/meal.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  const TabsScreen(this._favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, dynamic>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      {'title': 'DeliMeals', 'page': CategoriesScreen()},
      {'title': 'Favorites', 'page': FavoritesScreen(widget._favoriteMeals)}
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.pink[300],
        //type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(Icons.category),
              label: 'Category'),
          BottomNavigationBarItem(
              backgroundColor: Colors.pinkAccent,
              icon: Icon(Icons.favorite),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
