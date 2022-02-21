import 'package:casa_brisee/Model/database.dart';
import 'package:casa_brisee/Model/operation.dart';
import 'package:sqflite/sqflite.dart';

Future<int> save(Operation operation) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> operationMap = Map();
  operationMap['description'] = operation.description;
  operationMap['value'] = operation.value;
  operationMap['type'] = operation.type;

  return db.insert('operations', operationMap);
}

Future<List<Operation>> findAllOperations() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('operations');
  final List<Operation> operations = [];
  for (Map<String, dynamic> row in result) {
    final Operation operation = Operation(
        id: row['id'],
        description: row['description'],
        type: row['type'],
        value: row['value']);
    operations.add(operation);
  }
  for (Operation operation in operations) {
    print(operation.toString());
  }
  return operations;
}

Future<int> deleteOperationById(int id) async {
  final Database db = await getDatabase();
  return db.delete('operations', where: 'id = ?', whereArgs: [id]);
}

Future<void> restartOperationId() async {
  int id = 1;
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('operations');

  for (Map<String, dynamic> row in result) {
    db.update(
        'operations',
        {
          "id": id,
          "description": row['description'],
          "type": row['type'],
          "value": row['value']
        },
        where: 'id = ?',
        whereArgs: [row["id"]]);
    id = id + 1;
  }
}

Future<int> numberOfOperations() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('operations');
  return result.length;
}

Future<void> keepNumberOfOperationsFixed(int valueFixed) async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('operations');
  final numberOfOperations = result.length;
  if (numberOfOperations > valueFixed) {
    print("entrei no keep");
    await deleteOperationById(1);
    await restartOperationId();
  }
}
