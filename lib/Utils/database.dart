import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<void> createTables(sql.Database db) async {
    // Create Students table
    await db.execute('''
      CREATE TABLE Students (
        student_id INTEGER PRIMARY KEY,
        student_name TEXT,
        course TEXT,
        period TEXT,
        weekdays TEXT CHECK (weekdays IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday')),
        street TEXT,
        number TEXT,
        district TEXT,
        zip_code TEXT,
        photo_url TEXT,
        password TEXT
      )
    ''');

    // Create Drivers table
    await db.execute('''
      CREATE TABLE Drivers (
        driver_id INTEGER PRIMARY KEY,
        driver_license TEXT,
        pix_key TEXT,
        vehicle_type TEXT,
        capacity INTEGER,
        model TEXT,
        color TEXT,
        year INTEGER,
        plate TEXT,
        fuel TEXT
      )
    ''');

    // Create Pool table
    await db.execute('''
      CREATE TABLE Pool (
        entry_request TEXT,
        route TEXT,
        quantity INTEGER,
        driver_id INTEGER,
        student_id INTEGER,
        member TEXT,
        pool_id INTEGER PRIMARY KEY,
        FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
        FOREIGN KEY (student_id) REFERENCES Students(student_id)
      )
    ''');

    // Create Chat table
    await db.execute('''
      CREATE TABLE Chat (
        message TEXT,
        datetime TEXT,
        chat_id INTEGER PRIMARY KEY,
        pool_id INTEGER,
        FOREIGN KEY (pool_id) REFERENCES Pool(pool_id)
      )
    ''');

    // Create RidePayments table
    await db.execute('''
      CREATE TABLE RidePayments (
        payment_id INTEGER PRIMARY KEY,
        driver_id INTEGER,
        pool_id INTEGER,
        divided_value REAL,
        route TEXT,
        payment_status TEXT,
        FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id),
        FOREIGN KEY (pool_id) REFERENCES Pool(pool_id)
      )
    ''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'database/caronas.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }
}
