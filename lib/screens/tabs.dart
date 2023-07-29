import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favorite_provider.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:meals/widgets/filters.dart';
import 'package:meals/provider/filter_provider.dart';


const kFilter = {
  filter.glutenfilter: false,
  filter.lactosefilter: false,
  filter.veganfilter: false,
  filter.vegfilter: false
};

class TabsScreen extends  ConsumerStatefulWidget{
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  
  

  int _selectedPageIndex = 0;
  
 

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String Identifier) async {
    Navigator.pop(context);
    if (Identifier == 'filters') {
     await Navigator.push<Map<filter, bool>>(
          context,
          MaterialPageRoute(
            builder: (context) => const FilterScreen(),
          ));
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals= ref.watch(mealFIlter);
    

    Widget activePage = CategoriesScreen(
      
      availableMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favmeals=ref.watch(favProvider);

      activePage = MealScreen(
        meals: favmeals,
        
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: DrawerS(onSelect: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
