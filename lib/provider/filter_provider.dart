import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';


enum filter {
  glutenfilter,
  lactosefilter,
  veganfilter,
  vegfilter
  
}


class filterNotifier extends StateNotifier <Map<filter,bool>>{
  filterNotifier() :
    super({
      filter.glutenfilter : false,
      filter.lactosefilter : false,
            filter.veganfilter:  false,
            filter.vegfilter: false,
          });

          void setFilters(Map<filter,bool> chosenFilter) {
            state=chosenFilter;
          }

          void setFilter(filter filter,bool isActive) {
            state= {
              ...state, filter:isActive
            };
          }

    }
  



final filterProvider = StateNotifierProvider<filterNotifier,Map<filter,bool>>(
  (ref) =>filterNotifier() ,
) ;
  
  final mealFIlter =Provider((ref) {
    final meals= ref.watch(mealProvider);
    final activefilter = ref.watch(filterProvider);

        return meals.where((meal) {
      if (activefilter[filter.glutenfilter]! && !meal.isGlutenFree) {
        return false;
      }
      if (activefilter[filter.lactosefilter]! && !meal.isLactoseFree) {
        return false;
      }
      if (activefilter[filter.vegfilter]! && !meal.isVegetarian) {
        return false;
      }
      if (activefilter[filter.veganfilter]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();


  });
