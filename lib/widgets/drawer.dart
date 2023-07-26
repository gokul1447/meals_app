import 'package:flutter/material.dart';

class DrawerS extends StatelessWidget {
  const DrawerS({super.key,required this.onSelect});
  final void Function(String Identifier) onSelect;

  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.primaryContainer
            ], begin: Alignment.bottomLeft, end: Alignment.topCenter)),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood_outlined,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking Up',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant_menu,
            color:Theme.of(context).colorScheme.primary ,),
            title: Text('meals',  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 24),),
                      onTap: () {onSelect('meals');},
          ),
          ListTile(
            leading: Icon(Icons.settings,
            color:Theme.of(context).colorScheme.primary ,),
            title: Text('filters',  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.primary,fontSize: 24),),
                      onTap: () {onSelect('filters');},
          ),
        ],
      ),
    );
  }
}
