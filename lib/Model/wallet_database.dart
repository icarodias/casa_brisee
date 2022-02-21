import 'package:casa_brisee/Model/wallet.dart';
import 'package:sqflite/sqflite.dart';
import 'package:casa_brisee/Model/database.dart';

//CREATE
Future<int> createWallet(double initValue) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> walletMap = Map();
  walletMap['money'] = initValue;
  print(walletMap.toString());
  return db.insert('wallet', walletMap);
}

Future<List<Wallet>> findWallet() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('wallet');
  final List<Wallet> wallets = [];
  for (Map<String, dynamic> row in result) {
    final Wallet wallet = Wallet(
      id: row['id'],
      money: row['money'],
    );
    wallets.add(wallet);
  }

  return wallets;
}

Future<String> updateWallet(double price) async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('wallet');
  final row = result[0];
  db.update('wallet', {"id": 1, "money": row['money'] + price},
      where: 'id = ?', whereArgs: [row["id"]]);

  return "Valor R\$ ${row['money']}";
}
