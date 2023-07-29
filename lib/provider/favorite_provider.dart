import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
class favNotifier extends StateNotifier <List<Meal>>{
  favNotifier() : super([]);

  bool toggleFav(Meal meal) {
    final favMeal=state.contains(meal);

    if(favMeal) {
      state= state.where((m)=>m.id != meal.id).toList();
      return false;
    }
    else {
      state=[...state,meal];
      return true;
    }
  } 
}
final favProvider = StateNotifierProvider<favNotifier,List<Meal>>((ref) {
  return favNotifier();
  
},);