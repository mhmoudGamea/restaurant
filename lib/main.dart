import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './dummy_data.dart';
import './models/meal.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/filters_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
/* start filters */
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false
  };

  List<Meal> _availableMeals = dummyMeals;

  void _setFilters(Map<String, bool> filtersData) {
    _filters = filtersData;
    _availableMeals = dummyMeals.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) return false;
      if (_filters['vegan']! && !meal.isVegan) return false;
      if (_filters['vegetarian']! && !meal.isVegetarian) return false;
      if (_filters['lactose']! && !meal.isLactoseFree) return false;
      return true;
    }).toList();
  }

/* end filters */
/* start favorites */
  List<Meal> _favoriteMeals = [];

  void _toggleFavorites(String mealId) {
    int index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      //_favoriteMeals.removeWhere((meal) => meal.id == mealId);
      setState(() => _favoriteMeals.removeAt(index));
    } else {
      setState(() => _favoriteMeals
          .add(dummyMeals.firstWhere((meal) => meal.id == mealId)));
    }
  }

  bool _isFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

/* end favorites */

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent,
          textTheme: GoogleFonts.quicksandTextTheme(),
        ),
        title: 'DeliMeals',
        // home: CategoriesScreen(),
        routes: {
          '/': (context) => TabsScreen(_favoriteMeals),
          CategoryMealsScreen.rn: (context) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.rn: (context) =>
              MealDetailScreen(_toggleFavorites, _isFavorite),
          FiltersScreen.rn: (context) => FiltersScreen(_filters, _setFilters),
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (context) => CategoriesScreen());
        });
  }
}
