import 'package:baristabuddy/models/recipe.dart';
import 'package:flutter/cupertino.dart';

// This widget displays details for the given recipe and allows editing recipe information.
class RecipeDetail extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetail({super.key, required this.recipe});

  @override
  RecipeDetailState createState() => RecipeDetailState();
}

class RecipeDetailState extends State<RecipeDetail> {
  bool _isEditing = false;

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Recipe details - ${widget.recipe.name}'),
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
            onPressed: _toggleEditing,
            child: Icon(
              _isEditing ? CupertinoIcons.check_mark : CupertinoIcons.pen,
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
                header: Text('Recipe details'),
                children: [
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
                    initialValue: widget.recipe.name,
                    prefix: Text('Name'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.text,
                  ),
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
                    initialValue: widget.recipe.beans,
                    prefix: Text('Beans'),
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
                    initialValue: widget.recipe.dose.toString(),
                    prefix: Text('Dose'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
                    initialValue: widget.recipe.grindSize.toString(),
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
                    initialValue: widget.recipe.brewTime.toString(),
                    prefix: Text('Duration'),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                  ),
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
                    initialValue: widget.recipe.yield.toString(),
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
                header: Text('Additional information'),
                footer: Text(
                  'Use this space to take notes, describe the taste or anything you would like to change about the recipe in the future. It\'s up to you.',
                ),
                children: [
                  CupertinoTextFormFieldRow(
                    enabled: _isEditing,
                    initialValue:
                        widget.recipe.notes == null ? widget.recipe.notes : '',
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
