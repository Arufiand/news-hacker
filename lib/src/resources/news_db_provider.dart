import 'package:news_learning/src/models/item_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';

class NewsDbProvider {
  Database db;

  // init method
  init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'items.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database newDb, int version) {
        newDb.execute("""
          CREATE TABLE items 
            (
              id INTEGER PRIMARY KEY,
              type TEXT,
              by TEXT,
              time INTEGER,
              text TEXT,
              parent INTEGER,
              kids BLOB,
              dead INTEGER,
              deleted INTEGER,
              url TEXT,
              score INTEGER,
              title TEXT,
              descendants INTEGER
            )
        """);
      },
    );
  }

  fetchItem(int id) async {
    final maps = await db.query(
      "Items", // TABLE NAME
      columns: null, // COLUMN LIKE *
      where: "id = ?", // WHERE
      whereArgs: [id], // ???
    );

    if (maps.isNotEmpty) {
      return ItemModel.fromDb(maps.first);
    }

    return null;
  }

  addItem(ItemModel item) {
    return db.insert("Items", item.toMapForDb());
  }
}
