// this screen will show us the meals for the chosen category so if i choose italian category it will show me pizza and pasta an so on :)
import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const rn = '/category_meals';
  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var title;
  var displayedCategoryMeals;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final titleArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = titleArgument['id'];
    title = titleArgument['title'];
    displayedCategoryMeals = widget.availableMeals.where((meal) {
      // return a list of dummyMeals that contains Meals objects that satisfy the condition: categoryMeals = [ Meal(), Meal(), ...]
      return meal.categories.contains(id);
    }).toList();
    //print(categoryMeals[0].id);
  }

  void _remove(String mealId) {
    setState(() {
      displayedCategoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: displayedCategoryMeals[index].id,
              imageUrl: displayedCategoryMeals[index].imageUrl,
              title: displayedCategoryMeals[index].title,
              duration: displayedCategoryMeals[index].duration,
              complexity: displayedCategoryMeals[index].complexity,
              affordability: displayedCategoryMeals[index].affordability);
        },
        itemCount: displayedCategoryMeals.length,
      ),
    );
  }
}
