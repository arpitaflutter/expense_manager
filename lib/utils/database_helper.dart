import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sqflite/sqflite.dart';

class DBHelper {
  Database? database;
  static DBHelper dbHelper = DBHelper._();

  DBHelper._();

  Future<Database?> checkDb() async {
    if (database != null) {
      return database;
    } else {
      return await initDB();
    }
  }

  Future<Future<Database>> initDB() async {
    Directory directory = await getApplicationDocumentsDirectory();

    String path = join(directory.path, "Database.db");

    return openDatabase(path, onCreate: (db, version) {
      String query =
          "CREATE TABLE ExpenseManager (id INTEGER PRIMARY KEY AUTOINCREMENT,amount TEXT,notes TEXT,date TEXT,time TEXT,category TEXT,payTypes TEXT,status INTEGER)";
      db.execute(query);
    }, version: 1);
  }

  void insertDB(
      {required amount,
      required notes,
      required date,
      required time,
      required category,
      required payTypes,
      required status}) async {
    database = await checkDb();

    database!.insert("ExpenseManager", {
      "amount": amount,
      "notes": notes,
      "date": date,
      "time": time,
      "category": category,
      "payTypes": payTypes,
      "status": status
    });
  }

  Future<List<Map>> readDB() async {
    database = await checkDb();
    String query = "SELECT * FROM ExpenseManager";
    List<Map> readList = await database!.rawQuery(query);
    return readList;
  }

  Future<List<Map>> filterReadDB({required status}) async {
    database = await checkDb();
    String query = "SELECT * FROM ExpenseManager WHERE status = '$status'";
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }

  // Future<List<Map>> Datewise({required fromDate,required toDate,required status})
  // async {
  //   database = await checkDb();
  //   String query = "SELECT * FROM ExpenseManager WHERE date BETWEEN '$fromDate' AND '$toDate' AND status = '$status'";
  //
  //   List<Map> l1 = await database!.rawQuery(query);
  //   return l1;
  // }

  Future<List<Map>> allFilterRead(
      {fromDate, toDate, payTypes, status})
  async {
    String query = "";
    if(fromDate != null && toDate != null  && status == "All")
      {
        query = "SELECT * FROM ExpenseManager WHERE date BETWEEN '$fromDate' AND '$toDate'";
      }
    else if(fromDate != null && toDate != null  && status != null)
      {
        query = "SELECT * FROM ExpenseManager WHERE date BETWEEN '$fromDate' AND '$toDate' AND status = '$status'";
      }
    else if(status == "All" && payTypes != null)
      {
        query = "SELECT * FROM ExpenseManager WHERE payTypes = '$payTypes'";
      }
    else if(status != "All" && payTypes != null)
      {
        query = "SELECT * FROM ExpenseManager WHERE payTypes = '$payTypes'AND status = '$status'";
      }
    List<Map> l1 = await database!.rawQuery(query);
    return l1;
  }

  Future<void> updateDB(
      {required amount,
      required id,
      required notes,
      required category,
      required payTypes,
      required status}) async {
    database = await checkDb();

    database!.update(
        "ExpenseManager",
        {
          "category": category,
          "amount": amount,
          "notes": notes,
          "payTypes": payTypes,
          "status": status
        },
        where: "id = ?",
        whereArgs: [id]);
  }

  Future<void> deleteDB({required id}) async {
    database = await checkDb();
    database!.delete("ExpenseManager", where: "id = ?", whereArgs: [id]);
  }
}
