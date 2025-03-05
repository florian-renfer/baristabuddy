import 'package:baristabuddy/models/recipe.dart';
import 'package:baristabuddy/screens/recipe_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// This class displays a list entry for a brewing recipe.
class RecipeListEntry extends StatelessWidget {
  final Recipe recipe;

  const RecipeListEntry({super.key, required this.recipe});

  // This method opens a new screen and passes the BuildContext.
  void _navigateToNewScreen(BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(builder: (context) => RecipeDetail(recipe: recipe)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: key,
      closeOnScroll: true,
      endActionPane: const ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: null,
            backgroundColor: CupertinoColors.systemBrown,
            foregroundColor: CupertinoColors.white,
            icon: CupertinoIcons.folder,
            label: 'Archive',
          ),
        ],
      ),
      child: CupertinoListTile(
        onTap: () => _navigateToNewScreen(context),
        padding: EdgeInsets.all(16),
        title: Text(
          recipe.name,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text('This is a recipe for ${recipe.name}'),
        trailing: CupertinoListTileChevron(),
      ),
    );
  }
}
