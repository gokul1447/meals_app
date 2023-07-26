import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreen();
}

class _FilterScreen extends State<FilterScreen> {
  var _glutenfilter=false;
  var _lactosefilter=false;
  var _veganfilter=false;
  var _vegfilter=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: DrawerS(onSelect: (Identifier) {
        Navigator.pop(context);
        if(Identifier=='meals') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TabsScreen(),));

        }
      },),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenfilter,
            onChanged: (isCheked) {
              setState(() {
                _glutenfilter=isCheked;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
          ),

              SwitchListTile(
            value: _lactosefilter,
            onChanged: (isCheked) {
              setState(() {
                _lactosefilter=isCheked;
              });
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include Lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
          ),

              SwitchListTile(
            value: _veganfilter,
            onChanged: (isCheked) {
              setState(() {
                _veganfilter=isCheked;
              });
            },
            title: Text(
              'vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
          ),

              SwitchListTile(
            value: _vegfilter,
            onChanged: (isCheked) {
              setState(() {
                _vegfilter=isCheked;
              });
            },
            title: Text(
              'veg',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only include veg meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34,right: 22),
          ),
        ],
      ),
    );
  }
}
