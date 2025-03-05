import 'package:baristabuddy/screens/recipes.dart';
import 'package:flutter/cupertino.dart';

// This widget displays details for the given recipe and allows editing recipe information.
class RecipeDetail extends StatelessWidget {
  final Recipe recipe;
  bool _isEditing = false;

  RecipeDetail({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Recipe details - ${recipe.name}'),
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
            onPressed: () => {_isEditing = !_isEditing},
            child: Icon(
              CupertinoIcons.pen,
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
                    enabled: _isEditing,
                    initialValue: recipe.name,
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
                    enabled: _isEditing,
                    prefix: Text('Dose'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
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
                    enabled: _isEditing,
                    prefix: Text('Duration'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
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
                    enabled: _isEditing,
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
