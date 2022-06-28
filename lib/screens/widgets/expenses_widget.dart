import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qpay/constants.dart';

class ExpensesWidget extends StatelessWidget {
  final String title;
  final String number;
  final String amount;
  final String date;
  final String time;
  const ExpensesWidget({Key? key, required this.title, required this.number, required this.amount,
    required this.date, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: kGreenColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        )
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(
              color: Color(0x4B6D6679),
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
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
                      margin: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120,
                            child: Text(
                              title,
                              style: TextStyle(color: kGreyColor, fontSize: 17),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            number,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            date+
                                " | " +
                                time,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    "-"+amount,
                    style: const TextStyle(
                      color: kPrimaryAccentColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
