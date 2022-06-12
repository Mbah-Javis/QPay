import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/screens/validate_transaction/add_to_transactions.dart';

class TransactionsPage extends StatefulWidget{
  const TransactionsPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TransactionsPage();

}

class _TransactionsPage extends State<TransactionsPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AddToTransactionsWidget(),
        ],
      ),
    );
  }

}