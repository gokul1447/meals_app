import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealDeatail extends StatelessWidget {
  const MealDeatail({super.key, required this.onToggle, required this.meal});

  final Meal meal;
  final void Function(Meal meal) onToggle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {onToggle(meal);}, icon: Icon(Icons.star))],
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                  decorationStyle: TextDecorationStyle.solid),
            ),
            SizedBox(
              height: 16,
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.0,
                  decorationStyle: TextDecorationStyle.solid),
            ),
            SizedBox(
              height: 16,
            ),
            for (final steps in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  steps,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
