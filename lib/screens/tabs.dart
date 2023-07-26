import 'package:flutter/material.dart';

import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/drawer.dart';
import 'package:meals/widgets/filters.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {

  void showMsg(String msg){
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg),duration: Duration(seconds: 2),));
  }
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeal=[];
  void _toggleStatus(Meal meal) {
    final isOn= _favoriteMeal.contains(meal);
    if (isOn) {
      setState(() {
         _favoriteMeal.remove(meal);
      });
      showMsg('This meal is no longer on Favorites');
     

    }
    else {
      setState(() {
          _favoriteMeal.add(meal);
      });
         showMsg('This meal is on Favorites');
        }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  void _setScreen (String Identifier) {
     Navigator.pop(context);
    if(Identifier== 'filters') {
      Navigator.push(context, MaterialPageRoute(builder:(context) => FilterScreen(),));
    }
    
     
    
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(onToggle: _toggleStatus,);
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage =   MealScreen(meals:_favoriteMeal,onToggle: _toggleStatus ,);
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