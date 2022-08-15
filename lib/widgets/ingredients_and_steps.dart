import 'package:flutter/material.dart';

import '../models/meal.dart';

class IngredientsAndMeals extends StatelessWidget {
  final Meal meal;
  final List<String> str;

  const IngredientsAndMeals(this.meal, this.str);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.95,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.pinkAccent,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  str[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const Divider(),
            ],
          );
        },
        itemCount: (str.length),
      ),
    );
  }
}
