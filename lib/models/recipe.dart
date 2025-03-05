// This class represents attributes of a brewing recipe.
class Recipe {
  int? id;
  String name = 'Coffee recipe';
  String beans;
  String? notes;
  double grindSize = -1.0;
  double dose = -1.0;
  double yield = -1.0;
  double brewTime = -1.0;
  DateTime createdAt = DateTime.now().toUtc();
  DateTime updatedAt = DateTime.now().toUtc();

  Recipe({
    required this.name,
    required this.beans,
    required this.grindSize,
    required this.dose,
    required this.yield,
    required this.brewTime,
  });
}
