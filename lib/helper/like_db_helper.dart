import 'dart:convert';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../modals/food_models.dart';

class LikeDBHelper {
  LikeDBHelper._();

  static LikeDBHelper likeDBHelper = LikeDBHelper._();

  String DBpath = "";
  String table = "like";
  Database ? db;

  Future<Database?> inittDB() async {
    String path = await getDatabasesPath();
    DBpath = join(path, "databases.db");

    db = await openDatabase(DBpath, version: 1,
        onCreate: (Database db, version) async {
          String query =
              "CREATE TABLE IF NOT EXISTS $table(id INTEGER PRIMARY KEY AUTOINCREMENT, foodName TEXT ,price INTEGER,image BLOB,quantity INTEGER,like TEXT);";
          await db.execute(query);
        });
    String query =
        "CREATE TABLE IF NOT EXISTS $table(id INTEGER PRIMARY KEY AUTOINCREMENT, foodName TEXT ,price INTEGER,image BLOB,quantity INTEGER,like TEXT);";
    await db!.execute(query);
    return db;
  }

  Future<void> insertListData({required int id,required String name,required int price,required String image,required int quantity ,required String like}) async {
    db = await inittDB();
    String query = "INSERT INTO $table VALUES(?,?,?,?,?,?)";
    List args = [
      null,
      name,
      price,
      image,
      quantity,
      like,

    ];
    int? ids = await db?.rawInsert(query, args);
    print(" insert ==> $ids");

  }

  Future<List<Foods>> fetchListData() async {
    db = await inittDB();

    String query = "SELECT * FROM $table";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);

    List<Foods> foodData = foodFromJson(jsonEncode(data));

    print("object ==> ${data.length}");

    return foodData;
  }

  deletListData() async {
    db = await inittDB();
    String query = "DROP TABLE $table ";
    await db!.execute(query).then((value) {
      // print("$table ==> Delete ");
    });
  }
  deletData({required int id}) async {
    db = await inittDB();
    String query = "DELETE FROM $table WHERE id=$id";
    // print(" =>>>>>>>>>>>>>>> ${}");
    return await db!.rawDelete(query);
  }

  update({required String name,required String like}) async {
    db = await inittDB();
    String query = "UPDATE $table SET like=? WHERE name=?";
    List args = [
      like,name
      ];
    // print(" =>>>>>>>>>>>>>>> ${}");
    int count = await db!.rawUpdate(query,args);
    print(count);
    return count;
  }
}