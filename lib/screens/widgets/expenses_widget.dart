import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qpay/constants.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color(0x4B6D6679),
          offset: Offset(0.0, 1.0),
          blurRadius: 6.0,
        )
      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/expenses.png',
                    height: 55,
                    width: 55,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Breakfast",
                          style: TextStyle(color: kGreyColor, fontSize: 17),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(DateTime.now().toString())
                      ],
                    ),
                  ),
                ],
              ),
              Container(child: Text('500 XAF')),
            ],
          )
        ],
      ),
    );
  }
}
