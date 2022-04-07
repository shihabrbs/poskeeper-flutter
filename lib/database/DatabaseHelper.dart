import 'dart:io';
import 'package:flutter/services.dart';
import 'package:getx_project_flutter/model/Customer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final String _DB_NAME = 'nourish.db';
  static final _DB_VERSION = 1;
  static final table_customer = 'customer';
  static var status = '';

  //Constructor
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database ? _database;
  Future<Database>
  get database async =>
      _database ??= await _initDatabase();


  _initDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, _DB_NAME);

    //Check existing
    var exists = await databaseExists(path);
    if (!exists) {
      status = "Creating Database";

      //If not exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      //copy database
      ByteData data = await rootBundle.load(join("assets/db", _DB_NAME));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //Write
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      status = "Opening existing database";
      print('Opening existing database');
    }

    return await openDatabase(path, version: _DB_VERSION);
  }


  //InsertAllCustomer
  //Insert
   insertAllCustomer(List<Customer> customers) async {
    Database db = await instance.database;
    Batch batch = db.batch();

    customers.forEach((row) {
      Customer cust = Customer.fromJson(row.toJson());
      batch.insert(table_customer, cust.toJson());
    });

    batch.commit(continueOnError: true, noResult: true);
  }

  //Count
  Future<int?> getTotalCount(String tbl) async {
    var db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(id) FROM $tbl'));
  }


}
