import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meals/provider/filter_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title:const Text('Your filters  '),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activefilter[filter.glutenfilter]!,
            onChanged: (isCheked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter.glutenfilter, isCheked);
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
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activefilter[filter.lactosefilter]!,
            onChanged: (isCheked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter.lactosefilter, isCheked);
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
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
             value: activefilter[filter.veganfilter]!,
            onChanged: (isCheked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter.veganfilter, isCheked);
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
            contentPadding:const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
           value: activefilter[filter.vegfilter]!,
            onChanged: (isCheked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter.vegfilter, isCheked);
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
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
