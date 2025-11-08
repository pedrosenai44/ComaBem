import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:comabem/models/usuario.dart';

class UsuarioDAO {
  static const String _tableName = 'usuarios';
  static const String _dbName = 'comabem.db';
  static const int _dbVersion = 1;

  static Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, nome TEXT, login TEXT, senha TEXT)',
        );
      },
      version: _dbVersion,
    );
  }

  Future<void> cadastrar(Usuario usuario) async {
    final db = await _getDatabase();
    await db.insert(
      _tableName,
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
