import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

// This class represents attributes of a brewing recipe.
class Recipe {
  int id = -1;
  Text name = Text('Coffee recipe');
  double grindSize = -1.0;
  double dose = -1.0;
  double yield = -1.0;
  double brewTime = -1.0;
  DateTime createdAt = DateTime.now().toUtc();
  DateTime updatedAt = DateTime.now().toUtc();
  CupertinoDynamicColor color = CupertinoColors.systemRed;

  Recipe({
    this.id = -1,
    this.name = const Text('Coffee recipe'),
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

  final _recipes = <Recipe>[
    Recipe(id: 1, name: Text('Espresso'), color: CupertinoColors.systemPink),
    Recipe(id: 2, name: Text('Ristretto'), color: CupertinoColors.systemPink),
    Recipe(id: 3, name: Text('Lungo'), color: CupertinoColors.systemPink),
    Recipe(id: 4, name: Text('Americano'), color: CupertinoColors.systemPink),
    Recipe(
      id: 5,
      name: Text('Latte Macchiato'),
      color: CupertinoColors.systemPink,
    ),
    Recipe(id: 6, name: Text('Flat White'), color: CupertinoColors.systemPink),
    Recipe(id: 7, name: Text('Cappuccino'), color: CupertinoColors.systemPink),
    Recipe(
      id: 8,
      name: Text('Espresso Macchiato'),
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
              onPressed: () => print('Add recipe'),
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
            widthFactor: 0.9,
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
            return CupertinoListTile(
              title: _recipes[index].name,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              backgroundColor:
                  index % 2 == 0
                      ? CupertinoColors.tertiarySystemBackground
                      : CupertinoColors.secondarySystemBackground,
              additionalInfo: Text(
                DateFormat('MM/dd/yyyy').format(_recipes[index].updatedAt),
              ),
            );
          }, childCount: _recipes.length),
        ),
      ],
    );
  }
}
