import 'package:baristabuddy/models/recipe.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

// This class provides helper functions when working with SQLite databases.
class SqliteHelper {
  // Connects to baristabuddy SQLite database.
  static Future<Database> connect() async {
    String dbPath = join(await getDatabasesPath(), 'baristabuddy.db');

    // Get the correct directory for Android and iOS
    Directory dbDirectory;
    if (Platform.isIOS) {
      dbDirectory = await getLibraryDirectory();
      dbPath = join(dbDirectory.path, 'baristabuddy.db');
    }

    // Open the database
    return openDatabase(
      dbPath,
      // When the database is first created, create a table to store recipes.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute('''
          CREATE TABLE recipe (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL DEFAULT 'Coffee recipe',
            beans TEXT NOT NULL,
            notes TEXT,
            grind_size REAL NOT NULL DEFAULT -1.0,
            dose REAL NOT NULL DEFAULT -1.0,
            yield REAL NOT NULL DEFAULT -1.0,
            brew_time REAL NOT NULL DEFAULT -1.0,
            created_at TEXT NOT NULL DEFAULT (datetime('now', 'utc')),
            updated_at TEXT NOT NULL DEFAULT (datetime('now', 'utc'))
          );
        ''');
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

  // Creates a persistent recipe. Uses ConflictAlgorithm.replace.
  static Future<void> createRecipe(Recipe recipe) async {
    final db = await connect();

    await db.insert(
      'recipe',
      recipe.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Updates a persisted recipe.
  static Future<void> updateRecipe(Recipe recipe) async {
    if (recipe.id == null || recipe.id! < 0) {
      return;
    }

    final db = await connect();

    await db.update(
      'recipe',
      recipe.toMap(),
      where: 'id = ?',
      whereArgs: [recipe.id!],
    );
  }

  // A method that retrieves all the dogs from the dogs table.
  static Future<List<Recipe>> readRecipes() async {
    // Get a reference to the database.
    final db = await connect();

    // Query the table for all the dogs.
    final List<Map<String, Object?>> recipes = await db.query('recipe');
    print('\n\nRead recipes:\n$recipes\n\n');

    // Convert the list of each dog's fields into a list of `Dog` objects.
    List<Recipe> res = [
      for (final {
            'id': id as int,
            'name': name as String,
            'beans': beans as String,
            'notes': notes as String?,
            'grind_size': grindSize as double,
            'dose': dose as double,
            'yield': yieldAmount as double,
            'brew_time': brewTime as double,
            'created_at': createdAt as String,
            'updated_at': updatedAt as String,
          }
          in recipes)
        Recipe(
          id: id,
          name: name,
          beans: beans,
          notes: notes,
          grindSize: grindSize,
          dose: dose,
          yieldAmount: yieldAmount,
          brewTime: brewTime,
          createdAt: DateTime.parse(createdAt),
          updatedAt: DateTime.parse(updatedAt),
        ),
    ];

    print('\n\nParsed recipes:\n$res\n\n');

    return res;
  }
}
