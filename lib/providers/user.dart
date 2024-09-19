import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future<Database> getDatabase() async {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(path.join(dbPath, 'upvlocal.db'),
      onCreate: ((db, version) => {
            db.execute(
                'CREATE TABLE user_collections(id TEXT PRIMARY KEY,user_data TEXT)'),
          }),
      version: 1);
  return db;
}

//!  user
class UserNotifier extends StateNotifier {
  UserNotifier() : super(const []);

  dynamic loadUser() async {
    final db = await getDatabase();
    final data = await db.query('user_collections');
    // print("load user");
    if (data.isNotEmpty) {
      // print(
      //   json.decode(
      //     data[0]["user_data"].toString(),
      //   ),
      // );
      state = json.decode(
        data[0]["user_data"].toString(),
      );
    }

    await db.close();
    return data;
  }

  loadSpecificUser(data) {
    state = data;
  }

  void saveUser(user) async {
    // final db = await getDatabase();
    // db.insert("users_data", {'id': user["_id"], 'userid': json.encode(user)});
    // await db.close();

    final currentUser = user;

    // print(user);
    state = currentUser;
  }
}

final userProvider = StateNotifierProvider(
  (ref) => UserNotifier(),
);
