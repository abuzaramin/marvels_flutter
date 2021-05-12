import 'package:marvels_flutter/models/person.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'dart:convert';

class DatabaseHelper {
  //Create a private constructor
  DatabaseHelper._();

  static const databaseName = 'marvels_database.db';
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database _database;

  Future <Database> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE People(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, name TEXT, realname TEXT, team TEXT, firstAppearance TEXT, createdBy TEXT, publisher TEXT,"
                  " imageURL TEXT, bio TEXT, imdb TEXT, rottenTomatto TEXT, youtubeURL TEXT)");
        });
  }

  insertPeople(Person people) async {
    final db = await database;

    var res = await db.insert(Person.TABLENAME, people.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }


  Future <int> insertPeoples(List<Person> people) async {
    final db = await database;
    int count = await db.delete(Person.TABLENAME);
    var res;
    await people.forEach((element) {
      res = db.insert(Person.TABLENAME, element.toMap(),
          conflictAlgorithm:  ConflictAlgorithm.replace);
    });
    return res;
  }

  Future<List<Person>> getPeoples() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(Person.TABLENAME);
    return maps.isNotEmpty ? List.generate(maps.length, (i) => Person.fromDBJson(maps[i])) : [];

  }

  Future<Person> getPeople(int id) async {
    final db = await database;
    List<Map<String, dynamic>> mapList = await db.rawQuery('select * from People where id = :$id');
    return mapList == null ? null : Person.fromJson(mapList[0]);
  }
}