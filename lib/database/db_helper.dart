import 'package:qpay/models/transaction.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'user_transactions';

  static Future<void> initDb() async{
    if(_db != null){
      return;
    }
    try{
      String _path = await getDatabasesPath() + 'user_transactions.db';
      _db = await openDatabase(
          _path,
          version: _version,
          onCreate: (db, version){
            return db.execute(
              "CREATE TABLE $_tableName("
                  "id INTEGER PRIMARY KEY AUTOINCREMENT,"
                  "title STRING,"
                  "phoneNumber INTEGER,"
                  "amount INTEGER,"
                  "date STRING,"
                  "time STRING,"
                  "transactionType STRING)",
            );
          }
      );
    } catch(e){
    }
  }
  static Future<int> insert(UserTransaction userTransaction) async {
    print('adding ${userTransaction.title} transaction');
    return await _db!.insert(_tableName, userTransaction.toJson());
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> recentQuery() async {
    return await _db!.query(_tableName, orderBy: 'date', limit: 4);
  }

  static delete(int? id) async {
    await _db!.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}