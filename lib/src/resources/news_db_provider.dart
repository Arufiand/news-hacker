import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'dart:async';

// class NewsDbProvider {
//   Database db;
//
//   // init method
//   init() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'items.db');
//
//     db = await openDatabase(
//       path,
//       version: 1,
//       onCreate: (Database newDb, int version) {
//
//       },
//     );
//   }
// }
