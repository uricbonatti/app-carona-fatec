import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE aluno(
        ra INTEGER PRIMARY KEY NOT NULL,
        nomeAluno TEXT NOT NULL,
        cursoAluno TEXT,
        periodo INTEGER,
        foto TEXt,
        senha TEXT NOT NULL,
        diasSegunda INTEGER NOT NULL,
        diasTerca INTEGER NOT NULL,
        diasQuarta INTEGER NOT NULL,
        diasQuinta INTEGER NOT NULL,
        diasSexta INTEGER NOT NULL,
        diasSabado INTEGER NOT NULL,
        enderecoRua TEXT NOT NULL,
        enderecoNumero INTEGER NOT NULL,
        enderecoBairro TEXT NOT NULL,
        enderecoCEP INTEGER NOT NULL,
      ),
      CREATE TABLE motorista(
        cnh INTEGER PRIMARY KEY NOT NULL,
        chavePix TEXT NOT NULL,
        tipodechave INTEGER NOT NULL,
        veiculoTipo TEXT NOT NULL,
        veiculoCapacidade INTEGER NOT NULL,
        veiculoModelo TEXT NOT NULL,
        veiculoCor TEXT NOT NULL,
        veiculoAno INTEGER NOT NULL,
        veiculoPlaca TEXT NOT NULL,
        veiculoCombustivel NOT NULL 


      ),
      CREATE TABLE pool(
        idPool INTEGER NOT NULL,
        ra INTEGER NOT NULL,
        cnh INTEGER,
      ),
      CREATE TABLE poolFunc(
        idPool INTEGER NOT NULL,
        solicitacao INTEGER,
        
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kindacode.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {'title': title, 'description': descrption};
    final id = await db.insert('items', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(
      int id, String title, String? descrption) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('items', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
