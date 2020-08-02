import 'dart:async';
import 'package:vaccinator2/models/model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';

abstract class DB {
  static Database _db;

  static int get _version => 1;

  static Future<void> init() async {

    if (_db != null) { return; }

    try {
      String _path = await getDatabasesPath() + 'example';
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    }
    catch(ex) {
      print(ex);
    }
  }

  //CRUD for the various DBs

  //Template
  static void onCreate(Database db, int version) async{
    Batch batch = db.batch();
    batch.execute('CREATE TABLE clinic (clinicID INTEGER PRIMARY KEY NOT NULL IDENTITY(1, 1), clinicName STRING, clinicAddress STRING)');
    batch.execute('CREATE TABLE caregiver (caregiverID INTEGER PRIMARY KEY NOT NULL IDENTITY(1, 1), caregiverFName STRING, caregiverLName STRING, caregiverContact STRING,)');
    batch.execute('CREATE TABLE baby (babyID INTEGER PRIMARY KEY NOT NULL IDENTITY(1, 1), babyFName STRING, babyLName STRING, babyDOB DATE, babyWeight DOUBLE, caregiverID INT, FOREIGN KEY caregiverID references caregiver.caregiverID)');//babyFName, this.babyLName, this.babyDOB, this.babyWeight, this.caregiverID
    batch.execute('CREATE TABLE vaccine (vaccineID INTEGER PRIMARY KEY NOT NULL, vaccineName STRING, milestone STRING)');
    batch.execute('CREATE TABLE voucher (voucherID INTEGER PRIMARY KEY NOT NULL, caregiverID INT, vaccineID INT, FOREIGN KEY caregiverID references caregiver.caregiverID, vaccineID references vaccine.vaccineID)');
    batch.execute('CREATE TABLE records (recordID INTEGER PRIMARY KEY NOT NULL IDENTITY(1, 1), complete BOOLEAN, recordDate Date, vaccineID INT, babyID INT, clinicID INT, FOREIGN KEY vaccineID references vaccine.vaccineID, babyID references baby.babyID, clinicID references clinic.clinicID)');
    //await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, task STRING, complete BOOLEAN)');
    //await db.execute('CREATE TABLE todo_items (id INTEGER PRIMARY KEY NOT NULL, task STRING, complete BOOLEAN)');
    List<dynamic> res = await batch.commit();
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