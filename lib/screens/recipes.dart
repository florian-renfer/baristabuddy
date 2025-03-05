import 'package:flutter/cupertino.dart';
import 'package:baristabuddy/models/recipe.dart';
import 'package:baristabuddy/screens/recipe_create.dart';
import 'package:baristabuddy/widgets/recipe_list_entry.dart';

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
    Recipe(
      name: 'Espresso doppio',
      beans: 'Müller - Espresso Rossini',
      dose: 18.0,
      yield: 58.4,
      brewTime: 31,
      grindSize: 21,
    ),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
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
      ),
    );
  }
}
