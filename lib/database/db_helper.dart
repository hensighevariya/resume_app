import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:resume_app/model/user_data_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._instance();
  static Database? _db;

  DBHelper._instance();

  static const String userId = 'userId';
  static const String name = 'name';
  static const String email = 'email';
  static const String contact = 'contact';
  static const String summary = 'summary';
  static const String technicalSkill = 'technicalSkill';
  static const String experience = 'experience';
  static const String tableName = 'ResumeTable';
  static const String dbName = 'resume_table';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
    } else {
      print('Database Name : $_db');
      print('Database Check : ${_db!.isOpen}');
    }
    return _db;
  }

  _initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    final db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName ($userId integer primary key autoincrement, $name TEXT, $email TEXT, $contact TEXT, $summary TEXT, $technicalSkill TEXT, $experience TEXT)');
  }

  Future<List<Map<String, dynamic>>> getAllResumeDataMap() async {
    Database? dbClient = await db;
    final List<Map<String, dynamic>> result = await dbClient!.query(tableName);
    return result;
  }

  Future<List<UserDataModel>> getAllResumeList() async {
    final List<Map<String, dynamic>> resumeMapList =
        await getAllResumeDataMap();
    List<UserDataModel> resumeList = [];
    for (var element in resumeMapList) {
      resumeList.add(UserDataModel.fromJson(element));
    }
    resumeList.sort((userA, userB) => userA.name!.compareTo(userB.name!));
    return resumeList;
  }

  Future<int> addUser(UserDataModel userModel) async {
    Database? dbClient = await db;
    final int result = await dbClient!.insert(tableName, userModel.toJson());
    return result;
  }

  Future<int> updateUser(UserDataModel userModel, int id) async {
    Database? dbClient = await db;
    final int result = await dbClient!.update(tableName, userModel.toJson(),
        where: '$userId = ?', whereArgs: [id]);
    return result;
  }

  Future<int> deleteUser(int id) async {
    Database? dbClient = await db;
    final int result = await dbClient!
        .delete(tableName, where: '$userId = ?', whereArgs: [id]);
    return result;
  }
}
