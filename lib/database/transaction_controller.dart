import 'package:get/get.dart';
import 'package:qpay/models/transaction.dart';

import 'db_helper.dart';

class TransactionController extends GetxController{

  @override
  void onReady() {
    getTransactions();
    super.onReady();
  }

  var transactionList = <UserTransaction>[].obs;
  var recentTransactionList = <UserTransaction>[].obs;

  Future<int> addTransaction({UserTransaction? userTransaction}) async {
    return await DBHelper.insert(userTransaction!);
  }

  void getTransactions() async {
    List<Map<String, dynamic>> task = await DBHelper.query();
    transactionList.assignAll(task.map((data) => UserTransaction.fromJson(data)).toList());
  }

  void getRecentTransactions() async {
    List<Map<String, dynamic>> task = await DBHelper.recentQuery();
    recentTransactionList.assignAll(task.map((data) => UserTransaction.fromJson(data)).toList());
  }

  void delete(int? id){
    DBHelper.delete(id);
  }
}