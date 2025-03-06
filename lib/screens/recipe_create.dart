import 'package:baristabuddy/db/sqlite.dart';
import 'package:baristabuddy/models/recipe.dart';
import 'package:flutter/cupertino.dart';

// This widget displays details for the given recipe and allows editing recipe information.
class RecipeCreate extends StatelessWidget {
  const RecipeCreate({super.key});

  Future<void> saveRecipe() async {
    final Recipe recipe = Recipe(
      name: 'Espresso',
      brewTime: 31.0,
      dose: 18.0,
      grindSize: 21.0,
      beans: 'Müller, Espresso Rossini',
      yieldAmount: 61.4,
    );
    return SqliteHelper.createRecipe(recipe);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Create recipe'),
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
            onPressed: () async => saveRecipe(),
            child: Icon(
              CupertinoIcons.checkmark,
              color: CupertinoColors.white,
              size: 20,
            ),
          ),
        ),
      ),
      child: SafeArea(
        child: Container(
          color: CupertinoColors.systemGroupedBackground,
          child: ListView(
            children: [
              CupertinoFormSection.insetGrouped(
                header: Text('Recipe name'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Text('Name'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
              CupertinoFormSection.insetGrouped(
                header: Text('Grinding parameters'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Text('Dose'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    prefix: Text('Grind level'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                ],
              ),
              CupertinoFormSection.insetGrouped(
                header: Text('Brewing parameters'),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Text('Duration'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    prefix: Text('Yield'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                ],
              ),
              CupertinoFormSection.insetGrouped(
                header: Text('Additinoal information'),
                footer: Text(
                  'Use this space to take notes, describe the taste or anything you would like to change about the recipe in the future. It\'s up to you.',
                ),
                children: [
                  CupertinoTextFormFieldRow(
                    prefix: Text('Notes'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
