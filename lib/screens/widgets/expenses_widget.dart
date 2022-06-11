import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x4B6D6679),
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Text('This is some text'),
        ],
      ),
    );
  }

}