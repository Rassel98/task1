import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task_app/app/data/models/task_model.dart';

class LocalDBHelper {
  LocalDBHelper._init();
  static const String createAddTaskTable = '''CREATE TABLE $tableTask(
      $tabTaskColId INTEGER PRIMARY KEY AUTOINCREMENT,
      $tabTaskColTitle TEXT NOT NULL,
      $tabTaskColDescription TEXT,
      $tabTaskColStatus BOOLEAN NOT NULL,
      $tabTaskColCreatedAt TEXT
      )''';
  static final LocalDBHelper instance = LocalDBHelper._init();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    // final databasesPath = await getDatabasesPath();
    final databasesPath = await getApplicationDocumentsDirectory();
    final path = join(databasesPath.path, 'task.db');
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute(createAddTaskTable);
    },);
  }

  Future<int> insertData(TaskModel taskModel) async {
    // final db = await openDB();
    final db = await instance.database;
    return db.insert(tableTask, taskModel.toMap());
  }

  Future<List<TaskModel>> getAllTask() async {
    // final db = await openDB();
    final db = await instance.database;
    final List<Map<String, dynamic>> mapList = await db.query(tableTask, orderBy: '$tabTaskColCreatedAt ASC');
    return List.generate(mapList.length, (index) => TaskModel.fromMap(mapList[index]));
  }

  Future<TaskModel> getTaskById(int id) async {
    // final db = await openDB();
    final db = await instance.database;
    final mapList = await db.query(tableTask, where: '$tabTaskColId= ?', whereArgs: [id]);
    return TaskModel.fromMap(mapList.first);
  }

  Future<int> update(TaskModel taskModel) async {
    final db = await instance.database;
    return db.update(
      tableTask,
      taskModel.toMap(),
      where: '$tabTaskColId = ?',
      whereArgs: [taskModel.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await instance.database;
    return db.delete(tableTask, where: '$tabTaskColId= ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
