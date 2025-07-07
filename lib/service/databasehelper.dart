import 'dart:async';
import 'dart:convert';
// import 'dart:io';

// import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http_parser/http_parser.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class Databasehelper {
  static final Databasehelper _instance = Databasehelper._internal();
  static Database? _database;

  factory Databasehelper() => _instance;

  Databasehelper._internal();

  static final url = dotenv.env['API_BASE_URL'];

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String dbPath = await getDatabasesPath();
    String path = '$dbPath/database.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users (
            id INTEGER PRIMARY KEY,
            user_id TEXT,
            name TEXT,
            token TEXT
          )
        ''');
      },
    );
  }
  Future<bool> loginUser(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$url/login'),
        headers: {'Accept': 'application/json'},
        body: {
          'email': email,
          'password': password,
        },
      );
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final token = data['token'];
        final user = data['user'];

        final db = await database;

        await db.delete('users');

        await db.insert(
          'users',
          {
            'user_id': user['id'].toString(),
            'name': user['name'],
            'token': token,
          },
          conflictAlgorithm: ConflictAlgorithm.replace,
        );

        return true;
      } else {
        // print('Login fallido: ${response.body}');
        return false;
      }
    } catch (e) {
      // print('Error loginUser: $e');
      return false;
    }
  }
  Future<String?> getStoredToken() async {
    final db = await database;
    final res = await db.query('users', limit: 1);
    if (res.isNotEmpty) {
      return res.first['token'] as String;
    }
    return null;
  }
  Future<void> logout() async {
    final db = await database;
    await db.delete('users');
  }
  Future<UserModel?> getCurrentUser() async {
    final db = await database;
    final res = await db.query('users', limit: 1);
    if (res.isNotEmpty) {
      return UserModel.fromMap(res.first);
    }
    return null;
  }
}
