import 'dart:async';
import 'package:vaccinator2/models/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';// show getApplicationDocumentsDirectory;
import 'package:path/path.dart' show join;

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {

    if (_db != null) { return; }

    try {

      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      //String _path = join(documentsDirectory.path, 'example.db3');
      String _path = await getDatabasesPath() + 'example.db3';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    }
    catch(ex) {
      print(ex);
    }
  }

  //CRUD for the various DBs

  //Template
  static void onCreate(Database db, int version) async{
    //Batch batch = db.batch();
    await db.execute('CREATE TABLE IF NOT EXISTS clinic (id INTEGER PRIMARY KEY AUTOINCREMENT, clinicName STRING, clinicAddress STRING);');
    await db.execute('CREATE TABLE IF NOT EXISTS caregiver (id INTEGER PRIMARY KEY AUTOINCREMENT, caregiverFName STRING, caregiverLName STRING, caregiverContact STRING);');
    await db.execute('CREATE TABLE IF NOT EXISTS baby (id INTEGER PRIMARY KEY AUTOINCREMENT, babyFName STRING, babyLName STRING, babyDOB DATE, babyWeight DOUBLE, caregiverID INT, FOREIGN KEY(caregiverID) references caregiver(id));');//babyFName, this.babyLName, this.babyDOB, this.babyWeight, this.caregiverID
    await db.execute('CREATE TABLE IF NOT EXISTS vaccine (id INTEGER PRIMARY KEY NOT NULL, vaccineName STRING, milestone STRING);');
    await db.execute('CREATE TABLE IF NOT EXISTS voucher (id INTEGER PRIMARY KEY NOT NULL, caregiverID INT, vaccineID INT, FOREIGN KEY(caregiverID) references caregiver(id), FOREIGN KEY(vaccineID) references vaccine(id));');
    await db.execute('CREATE TABLE IF NOT EXISTS records (id INTEGER PRIMARY KEY AUTOINCREMENT, complete BOOLEAN, recordDate Date, vaccineID INT, babyID INT, clinicID INT, FOREIGN KEY(vaccineID) references vaccine(id),FOREIGN KEY(babyID) references baby(id), FOREIGN KEY(clinicID) references clinic(id));');
    //await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, task STRING, complete BOOLEAN)');
    //await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, task STRING, complete BOOLEAN)');
    //List<dynamic> res = await batch.commit();
  }

  static findClinics(Database db) async{
    db.execute('SELECT * FROM clinic');
  }
  static Future<List<Map<String, dynamic>>> query(String table) async => _db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async =>
      await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
  //

  //Clinic
    //C
  static void onCreateClinic(Database db, int version) async =>
      await db.execute('CREATE TABLE clinic (clinicID INTEGER PRIMARY KEY NOT NULL, clinicName STRING, clinicAddress STRING)');

  //static Future<List<Map<String, dynamic>>> queryClinic(String table) async => _db.queryClinic(table);

  static Future<int> insertClinic(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> updateClinic(String table, Model model) async =>
      await _db.update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> deleteClinic(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);
}