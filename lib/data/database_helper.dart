import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import '../model/user_model.dart';
//Nuevos importes
import '../model/exercise_model.dart';
import '../model/routine_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();
  factory DBHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'fworkout.db');
    Database db = await openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
    print('[DBHelper] initDB: Success');
    return db;
  }

  void _createTables(Database db, int version) async {
    await db.execute(
      'CREATE TABLE User(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, email TEXT, password TEXT)',
    );
    print('[DBHelper] _createTables (User): Success');
    //Nueva creación de tablas: Rutinas y Ejercicios:
    await db.execute(
      'CREATE TABLE Routine(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, category TEXT, durationMin TEXT)',
    );
    print('[DBHelper] _createTables (Routine): Success');
    await db.execute(
      'CREATE TABLE Exercise(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, category TEXT, sets INTEGER, timeMin INTEGER, loadKg INTEGER, idUser INTEGER, idRoutine INTEGER)',
    );
    print('[DBHelper] _createTables (Exercise): Success');
  }

  void saveUser(String name, String email, String password) async {
    var dbClient = await db;
    await dbClient.transaction((trans) async {
      return await trans.rawInsert(
        'INSERT INTO User(name, email, password) VALUES(\'$name\', \'$email\', \'$password\')',
      );
    });
    print('[DBHelper] saveUser: Success | $name, $email, $password');
  }

  Future<List<User>> getUser(String email, String password) async {
    var dbClient = await db;
    List<User> usersList = List();
    List<Map> queryList = await dbClient.rawQuery(
      'SELECT * FROM User WHERE email=\'$email\' AND password=\'$password\'',
    );
    print('[DBHelper] getUser: ${queryList.length} users');
    if (queryList != null && queryList.length > 0) {
      for (int i = 0; i < queryList.length; i++) {
        usersList.add(User(
          queryList[i]['id'].toString(),
          queryList[i]['name'],
          queryList[i]['email'],
          queryList[i]['password'],
        ));
      }
      print('[DBHelper] getUser: ${usersList[0].name}');
      return usersList;
    } else {
      print('[DBHelper] getUser: User is null');
      return null;
    }
  }

  //Métodos save y get para Routine
  void saveRoutine(
    String name,
    String description,
    String category,
    String durationMin,
    //String idUser,
    //String idExercise,
  ) async {
    var dbClient = await db;
    await dbClient.transaction((trans) async {
      return await trans.rawInsert(
        'INSERT INTO Routine(name, description, category, durationMin) VALUES(\'$name\', \'$description\', \'$category\', \'$durationMin\')',
      );
    });
    print(
      '[DBHelper] saveRoutine: Success | $name, $description, $category, $durationMin',
    );
  }

  Future<List<Routine>> getRoutine(String id) async {
    var dbClient = await db;
    List<Routine> routinesList = List();
    List<Map> queryList = await dbClient.rawQuery(
      'SELECT * FROM Routine WHERE id=\'$id\'',
    );
    print('[DBHelper] getRoutine: ${queryList.length} routines');
    if (queryList != null && queryList.length > 0) {
      for (int i = 0; i < queryList.length; i++) {
        routinesList.add(Routine(
          queryList[i]['id'].toString(),
          queryList[i]['name'],
          queryList[i]['description'],
          queryList[i]['category'],
          queryList[i]['duration'],
        ));
      }
      print('[DBHelper] getRoutine: ${routinesList[0].name}');
      return routinesList;
    } else {
      print('[DBHelper] getRoutine: Routine is null');
      return null;
    }
  }

  //Métodos save y get para Exercise
  void saveExercise(
    String name,
    String description,
    String category,
    int sets,
    int timeMin,
    int loadKg,
    int idUser,
    int idRoutine,
  ) async {
    var dbClient = await db;
    await dbClient.transaction((trans) async {
      return await trans.rawInsert(
        'INSERT INTO Exercise(name, description, category, sets, timeMin, loadKg, idUser, idRoutine) VALUES(\'$name\', \'$description\', \'$category\', $sets, $timeMin, $loadKg, $idUser, $idRoutine)',
      );
    });
    print(
        '[DBHelper] saveExercise: Success | $name, $description, $category, $sets, $timeMin, $loadKg, $idUser, $idRoutine');
  }

  Future<List<Exercise>> getExercise(String id) async {
    var dbClient = await db;
    List<Exercise> exercisesList = List();
    List<Map> queryList = await dbClient.rawQuery(
      'SELECT * FROM Exercise WHERE id=\'$id\'',
    );
    print('[DBHelper] getExercise: ${queryList.length} exercises');
    if (queryList != null && queryList.length > 0) {
      for (int i = 0; i < queryList.length; i++) {
        exercisesList.add(Exercise(
          queryList[i]['id'].toString(),
          queryList[i]['name'],
          queryList[i]['description'],
          queryList[i]['category'],
          queryList[i]['sets'],
          queryList[i]['timeMin'],
          queryList[i]['loadKg'],
          queryList[i]['idUser'],
          queryList[i]['idRoutine'],
        ));
      }
      print('[DBHelper] getExercise: ${exercisesList[0].name}');
      return exercisesList;
    } else {
      print('[DBHelper] getUser: Exercise is null');
      return null;
    }
  }
}
