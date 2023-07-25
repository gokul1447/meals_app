import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';




class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onselect
   
  });

  final Category category;
  final void Function() onselect;
  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselect,
        
      
      splashColor: Theme.of(context).splashColor,
      borderRadius: BorderRadius.circular(28),
      child: Container(
        padding: const EdgeInsets.all(16),
        
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
            gradient: LinearGradient(
          colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ),
    );
  }
}
