import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.onToggle});
  final void Function(Meal meal) onToggle;

  void _selectCategory(BuildContext context, Category category){

    final filteredMeal = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context,MaterialPageRoute(builder: (context) => MealScreen(title: category.title, meals: filteredMeal,onToggle: onToggle),) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // availableCategories.map((category) => CategoryGridItem(category: category)).toList()
          for (final category in availableCategories)
            CategoryGridItem(category: category, onselect: () {
              _selectCategory(context,category);
              
            },)
        ],
      ),
    );
  }
}
