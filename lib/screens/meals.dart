

import 'package:flutter/material.dart';
import 'package:meals/screens/meal_deatail.dart';
import 'package:meals/widgets/meal_item.dart';

import '../models/meal.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meals});
  final String? title;
  final List<Meal> meals;
  

  void selectmeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDeatail(meal: meal ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Text('No meals found',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index],onselectmeal: (meal) {
          selectmeal(context, meal);
        }, ),
      );
    }
if(title==null) {
  return content;
}

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
