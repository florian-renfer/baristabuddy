import 'package:flutter/cupertino.dart';
import 'package:baristabuddy/screens/recipes.dart';

class DefaultLayout extends StatelessWidget {
  const DefaultLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: 0,
        activeColor: CupertinoColors.systemBrown,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Recipes',
            activeIcon: Icon(CupertinoIcons.book_fill),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            label: 'Dial in',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          default:
            returnValue = CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: Center(child: RecipeList()),
                );
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}
