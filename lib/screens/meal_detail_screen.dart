import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../helper/helper.dart';
import '../widgets/ingredients_and_steps.dart';

class MealDetailScreen extends StatelessWidget {
  static const rn = '/meal_detail';

  final Function _toggleFavorites;
  final Function _isFavorite;

  const MealDetailScreen(this._toggleFavorites, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    final idArgument = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = dummyMeals.firstWhere((meal) {
      // return only one meal
      return meal.id == idArgument;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Helper.buildSectionTitle('Ingredients'),
            IngredientsAndMeals(selectedMeal, selectedMeal.ingredients),
            Helper.buildSectionTitle('Steps'),
            IngredientsAndMeals(selectedMeal, selectedMeal.steps),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[100],
          onPressed: () => _toggleFavorites(idArgument),
          child: Icon(
            _isFavorite(idArgument) ? Icons.favorite : Icons.favorite_border,
            color: Colors.pinkAccent,
          )),
    );
  }
}
