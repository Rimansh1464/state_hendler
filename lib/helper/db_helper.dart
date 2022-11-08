import 'dart:convert';

import 'package:food_app/modals/food_models.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../utils/list.dart';

class DBhelper {
  DBhelper._();

  static final DBhelper dBhelper = DBhelper._();
  Database? db;
  String databasepath = "";
  String? table = "FOODS";

  Future<Database?> initDB() async {
    String path = await getDatabasesPath();
    databasepath = join(path, "databases.db");

    db = await openDatabase(databasepath, version: 1,
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

  Future<void> insertData({required List<Foods> foodlist}) async {
    await deletData();
    db = await initDB();

    int i = 0;
    while (i < foodlist.length) {
      Foods value = foodlist[i];
      String query = "INSERT INTO $table VALUES (?,?,?,?,?,?);";
      List args = [
        value.id,
        value.foodName,
        value.price,
        value.image,
        value.quantity,
        value.like,
      ];
      //print(foodlist.length);

      await db?.rawInsert(query, args);
      i++;
    }
    i = 0;
  }

  Future<List<Foods>> fetchData() async {
    db = await initDB();

    String query = "SELECT * FROM $table";
    List<Map<String, dynamic>> data = await db!.rawQuery(query);

    List<Foods> foodData = foodFromJson(jsonEncode(data));

    print("object ==> ${data.length}");

    return foodData;
  }
  Future<List<Foods>> likecategory({required String val}) async {

    db = await initDB();

    String query = "SELECT * FROM $table WHERE like LIKE '%$val%';";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<Foods> like = foodFromJson(jsonEncode(res));

    return like;
  }
  Future<List<Foods>> searchCategory({required String name}) async {
    db = await initDB();

    String query = "SELECT * FROM $table WHERE foodName LIKE '%$name%';";

    List<Map<String, dynamic>> res = await db!.rawQuery(query);

    List<Foods> search = foodFromJson(jsonEncode(res));

    return search;
  }
  deletData() async {
    db = await initDB();
    String query = "DROP TABLE $table ";
    await db!.execute(query).then((value) {
      // print("$table ==> Delete ");
    });
  }
  update({required String name,required String like}) async {
    db = await initDB();
    String query = "UPDATE $table SET like=? WHERE foodName=?";
    List args = [
      like,name
    ];

    return  await db!.rawUpdate(query,args);


  }
}
