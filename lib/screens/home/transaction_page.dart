import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qpay/database/transaction_controller.dart';

class TransactionsPage extends StatefulWidget{
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsPage();

}

class _TransactionsPage extends State<TransactionsPage>{

  final _taskController = Get.put(TransactionController());


  @override
  void initState() {
    super.initState();
    _taskController.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50,),
          TextButton(onPressed: (){
            _taskController.getTransactions();
            print(_taskController.transactionList.length);
          }, child: Text('Get transactions')),
          Center(
            child: Container(
                margin: EdgeInsets.all(100),
                child: Text(_taskController.transactionList.length.toString()
                )
        ),
      ),
          /*Expanded(
            child: Obx(() {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _taskController.transactionList.length,
                  itemBuilder: (_, index){
                    print(_taskController.transactionList.length);
                    return Center(
                      child: Container(
                          margin: EdgeInsets.all(100),
                          child: Text(_taskController.transactionList.length.toString()
                          )
                      ),
                    );
                  }
              );
            }),
          )*/
        ],
      ),
    );
  }

}