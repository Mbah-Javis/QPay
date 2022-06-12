import 'package:qpay/models/transaction.dart';

import 'db_helper.dart';

class TaskController extends GetxController{

  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  var transactionList = <UserTransaction>[].obs;

  Future<int> addTask({UserTransaction? task}) async {
    return await DBHelper.insert(task!);
  }

  void getTask() async {
    List<Map<String, dynamic>> task = await DBHelper.query();
    transactionList.assignAll(task.map((data) => UserTransaction.fromJson(data)).toList());
  }

  void delete(int? id){
    DBHelper.delete(id);
  }
}