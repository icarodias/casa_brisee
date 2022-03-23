import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'casabrisee.db');

  const products = '''CREATE TABLE IF NOT EXISTS products(
        id INTEGER PRIMARY KEY, 
        name TEXT, 
        amount INTEGER, 
        price DOUBLE, 
        path_image TEXT)''';

  const operations = '''CREATE TABLE IF NOT EXISTS operations(
        id INTEGER PRIMARY KEY, 
        description TEXT, 
        value DOUBLE, 
        type INTEGER)''';

  const wallet = '''CREATE TABLE IF NOT EXISTS wallet(
        id INTEGER PRIMARY KEY,
        money DOUBLE)''';

  return openDatabase(
    path,
    onCreate: (db, int version) async {
      await db.execute(products);
      await db.execute(operations);
      await db.execute(wallet);
    },
    version: 1,
  );

  //final;
}
