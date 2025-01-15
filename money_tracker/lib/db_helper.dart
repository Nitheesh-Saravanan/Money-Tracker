import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart' hide Transaction;
import '../models/transaction_model.dart';


class DBHelper {
  static final DBHelper _instance = DBHelper._();
  static Database? _database;

  DBHelper._();

  factory DBHelper() {
    return _instance;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'money_tracker.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user_master (
        user_id INTEGER PRIMARY KEY AUTOINCREMENT,
        u_name TEXT NOT NULL,
        u_email TEXT NOT NULL
      );
    ''');

    await db.execute('''
      CREATE TABLE tran_mode (
        mode CHAR(1) PRIMARY KEY,
        description TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE tran_category (
        category CHAR(1) PRIMARY KEY,
        description TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE tran_status (
        status INTEGER PRIMARY KEY,
        description TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE transactions (
        tran_id INTEGER PRIMARY KEY AUTOINCREMENT,
        time_stamp TEXT NOT NULL,
        type CHAR(1) NOT NULL,
        category CHAR(1),
        description TEXT,
        value INTEGER NOT NULL,
        location TEXT,
        mode CHAR(1),
        person_involved INTEGER,
        status INTEGER,
        FOREIGN KEY (category) REFERENCES tran_category (category),
        FOREIGN KEY (mode) REFERENCES tran_mode (mode),
        FOREIGN KEY (status) REFERENCES tran_status (status)
      );
    ''');

    // Insert default values
    await _insertDefaultValues(db);
  }

  Future<void> _insertDefaultValues(Database db) async {
    await db.insert('tran_mode', {'mode': 'C', 'description': 'Cash'});
    await db.insert('tran_mode', {'mode': 'B', 'description': 'Bank'});

    await db.insert('tran_category', {'category': 'F', 'description': 'Food'});
    await db.insert('tran_category', {'category': 'T', 'description': 'Travel'});

    await db.insert('tran_status', {'status': 1, 'description': 'Pending'});
    await db.insert('tran_status', {'status': 2, 'description': 'Completed'});
  }

    Future<List<Transaction>> getAllTransactions() async {
    final db = await database;
    final result = await db.query('transactions');
    return result.map((e) => Transaction.fromMap(e)).toList();
  }

}
