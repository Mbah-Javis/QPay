import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/constants.dart';

class AddToTransactionsWidget extends StatefulWidget{
  const AddToTransactionsWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddToTransactionsWidget();

}

class _AddToTransactionsWidget extends State<AddToTransactionsWidget>{
  @override
  Widget build(BuildContext context) {

    return Column(
        children: [
          SizedBox(height: 300,),
          Center(child: Text("Add to Transactions?")),
          TextButton(
              onPressed: (){
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.SUCCES,
                  barrierColor: Colors.white,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Transaction',
                  desc: 'Add this transfer to your Transaction history?',
                  btnCancelOnPress: () {},
                  btnOkColor: kPrimaryColor,
                  btnCancelColor: kGreyColor,
                  btnOkText: 'Yes',
                  btnCancelText: 'No',
                  btnOkOnPress: () {},
                ).show();
              },
              child: Text('Show dialog')
          )
        ],
      );
  }

}