import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  const FavoritesScreen(this._favoriteMeals);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return widget._favoriteMeals.isEmpty
        ? const Center(
            child: Text('No favorites added yet!'),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return MealItem(
                  id: widget._favoriteMeals[index].id,
                  imageUrl: widget._favoriteMeals[index].imageUrl,
                  title: widget._favoriteMeals[index].title,
                  duration: widget._favoriteMeals[index].duration,
                  complexity: widget._favoriteMeals[index].complexity,
                  affordability: widget._favoriteMeals[index].affordability);
            },
            itemCount: widget._favoriteMeals.length,
          );
  }
}
