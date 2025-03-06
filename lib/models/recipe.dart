// This class represents attributes of a brewing recipe.
class Recipe {
  int? id;
  String name = 'Coffee recipe';
  String beans;
  String? notes;
  double grindSize = -1.0;
  double dose = -1.0;
  double yieldAmount = -1.0;
  double brewTime = -1.0;
  DateTime? createdAt;
  DateTime? updatedAt;

  Recipe({
    this.id,
    required this.name,
    required this.beans,
    this.notes,
    required this.grindSize,
    required this.dose,
    required this.yieldAmount,
    required this.brewTime,
    this.createdAt,
    this.updatedAt,
  });

  // Converts the entity to a sqflite compatible map.
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'beans': beans,
      'notes': notes,
      'grind_size': grindSize,
      'dose': dose,
      'yield': yieldAmount,
      'brew_time': brewTime,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return '{id: $id, name: $name, beans: $beans, notes: $notes, grindSize: $grindSize, dose: $dose, yield: $yieldAmount, brewTime: $brewTime, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
