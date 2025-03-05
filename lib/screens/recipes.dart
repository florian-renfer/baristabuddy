import 'package:flutter/cupertino.dart';

import '../widgets/recipe_list_entry.dart';
import 'package:baristabuddy/screens/recipe_create.dart';

// This class represents attributes of a brewing recipe.
class Recipe {
  int id = -1;
  String name = 'Coffee recipe';
  double grindSize = -1.0;
  double dose = -1.0;
  double yield = -1.0;
  double brewTime = -1.0;
  DateTime createdAt = DateTime.now().toUtc();
  DateTime updatedAt = DateTime.now().toUtc();
  CupertinoDynamicColor color = CupertinoColors.systemRed;

  Recipe({
    this.id = -1,
    this.name = 'Coffee recipe',
    this.grindSize = -1.0,
    this.dose = -1.0,
    this.yield = -1.0,
    this.brewTime = -1.0,
    this.color = CupertinoColors.systemRed,
  });
}

// This widget displays stored recipies as list.
class RecipeList extends StatelessWidget {
  RecipeList({super.key});

  // This method opens a new screen and passes the BuildContext.
  void _navigateToNewScreen(BuildContext context) {
    Navigator.of(
      context,
    ).push(CupertinoPageRoute(builder: (context) => RecipeCreate()));
  }

  final _recipes = <Recipe>[
    Recipe(id: 1, name: 'Espresso', color: CupertinoColors.systemPink),
    Recipe(id: 2, name: 'Ristretto', color: CupertinoColors.systemPink),
    Recipe(id: 3, name: 'Lungo', color: CupertinoColors.systemPink),
    Recipe(id: 4, name: 'Americano', color: CupertinoColors.systemPink),
    Recipe(id: 5, name: 'Latte Macchiato', color: CupertinoColors.systemPink),
    Recipe(id: 6, name: 'Flat White', color: CupertinoColors.systemPink),
    Recipe(id: 7, name: 'Cappuccino', color: CupertinoColors.systemPink),
    Recipe(
      id: 8,
      name: 'Espresso Macchiato',
      color: CupertinoColors.systemPink,
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: const Text('Recipes'),
          leading: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: CupertinoColors.secondarySystemBackground,
              shape: BoxShape.circle,
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(20),
              onPressed: () => print('Select recipes'),
              child: Icon(
                CupertinoIcons.ellipsis,
                color: CupertinoColors.secondaryLabel,
                size: 20,
              ),
            ),
          ),
          trailing: Container(
            width: 32.0,
            height: 32.0,
            decoration: BoxDecoration(
              color: CupertinoColors.systemBrown,
              shape: BoxShape.circle,
            ),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              borderRadius: BorderRadius.circular(20),
              onPressed: () => {_navigateToNewScreen(context)},
              child: Icon(
                CupertinoIcons.add,
                color: CupertinoColors.white,
                size: 20,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: FractionallySizedBox(
            widthFactor: 0.94,
            child: ClipRect(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: CupertinoSearchTextField(
                  controller: null,
                  onChanged: (value) {
                    print('Search changed');
                  },
                  onSubmitted: (value) {
                    print('Search changed');
                  },
                  onSuffixTap: () {
                    print('Search changed');
                  },
                ),
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 5,
          ),
          delegate: SliverChildBuilderDelegate((
            BuildContext context,
            int index,
          ) {
            return RecipeListEntry(recipe: _recipes[index]);
          }, childCount: _recipes.length),
        ),
      ],
    );
  }
}
