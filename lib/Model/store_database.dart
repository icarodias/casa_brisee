import 'package:casa_brisee/Model/database.dart';
import 'package:casa_brisee/Model/product.dart';
import 'package:sqflite/sqflite.dart';

//CREATE NEW PRODUCT
Future<int> create(Product product) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> productMap = Map();
  productMap['name'] = product.name;
  productMap['amount'] = product.amount;
  productMap['price'] = product.price;
  productMap['path_image'] = product.pathImage;
  return db.insert('products', productMap);
}

Future<List<Product>> findAllProducts() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('products');
  final List<Product> products = [];
  for (Map<String, dynamic> row in result) {
    final Product product = Product(
      id: row['id'],
      name: row['name'],
      amount: row['amount'],
      price: row['price'],
      pathImage: row['path_image'],
    );
    products.add(product);
  }

  return products;
}

Future<int> deleteProductsById(int id) async {
  final Database db = await getDatabase();
  return db.delete('products', where: 'id = ?', whereArgs: [id]);
}

Future<void> restartProductsId() async {
  int id = 1;
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('products');

  for (Map<String, dynamic> row in result) {
    db.update(
        'products',
        {
          "id": id,
          "name": row['name'],
          "amount": row['amount'],
          "price": row['price'],
          "path_image": row['path_image']
        },
        where: 'id = ?',
        whereArgs: [row["id"]]);
    id = id + 1;
  }
}

Future<String> updateProductAmountById(int id, int newAmount) async {
  await restartProductsId();
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('products');
  final row = result[id - 1];
  db.update(
      'products',
      {
        "id": id,
        "name": row['name'],
        "amount": newAmount,
        "price": row['price'],
        "path_image": row['path_image']
      },
      where: 'id = ?',
      whereArgs: [row["id"]]);

  return "${row['name']} tem ${row['amount']}";
}

Future<int> numberOfProducts() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('products');

  return result.length;
}
