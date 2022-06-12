import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qpay/constants.dart';

class ExpensesWidget extends StatelessWidget {
  const ExpensesWidget({Key? key}) : super(key: key);

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
                            child: const Text(
                              "Bag of rice",
                              style: TextStyle(color: kGreyColor, fontSize: 17),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            "To: 677730204",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            DateFormat.yMMMd().format(DateTime.now()) +
                                " | " +
                                DateFormat.jm().format(DateTime.now()),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  child: const Text(
                    '-20000 XAF',
                    style: TextStyle(
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
