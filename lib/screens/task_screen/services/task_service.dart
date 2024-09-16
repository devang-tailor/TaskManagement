import 'package:taskmanagement/res/exports/common_exports.dart';


class TaskService {
  static Database? _database;

  static const String db ="tasks.db";
  static const String tableName ="tasks";

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), db);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tasks (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        isCompleted INTEGER
      )
    ''');
  }

  Future<List<Task>> getTasks() async {
    final db = await database;
    final tasks = await db.query(tableName);
    return tasks.map((task) => Task.fromJson(task)).toList();
  }

  Future<void> addTask(Task task) async {
    final db = await database;
    await db.insert(tableName, task.toJson());
  }

  Future<void> updateTask(Task task) async {
    final db = await database;
    await db.update(tableName, task.toJson(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<void> deleteTask(Task task) async {
    final db = await database;
    await db.delete(tableName, where: 'id = ?', whereArgs: [task.id]);
  }
}