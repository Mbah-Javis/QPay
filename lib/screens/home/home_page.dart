import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qpay/constants.dart';
import 'package:qpay/database/transaction_controller.dart';
import 'package:qpay/input_field.dart';
import 'package:qpay/screens/expenses/expenses_screen.dart';
import 'package:qpay/screens/receive_money/receive_money_screen.dart';
import 'package:qpay/screens/send_money/send_money_screen.dart';
import 'package:qpay/screens/validate_transaction/validate_transaction.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController itemPurchasedController = TextEditingController();

  List<String> mtnNumbers = ['650', '651', '652', '653', '654', '67', '680'];
  List<String> orangeNumbers = ['655', '656', '657', '658', '659', '69'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            padding: const EdgeInsets.only(bottom: 4),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  alignment: Alignment.topCenter,
                  child: const Text(
                    'QPay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    width: 42,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kLightColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.deepPurple,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: const EdgeInsets.only(top: 50, left: 20),
                    alignment: Alignment.topLeft,
                    child: const Icon(
                      Icons.menu_rounded,
                      size: 25,
                      color: Colors.white,
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    'assets/images/money.svg',
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: kPrimaryColor,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 35, left: 20),
                            child: const Text(
                              '****** XAF',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ),
                          Container(
                              width: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: kGreenColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              margin: const EdgeInsets.only(top: 30, left: 15),
                              child: const Text(
                                '+10',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              )),
                        ],
                      ),
                      Container(
                        width: 140,
                        margin: const EdgeInsets.only(top: 90, left: 20),
                        child: TextButton(
                          onPressed: () {
                            TransactionController().getTransactions();
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const ExpensesScreen(),
                                    type: PageTransitionType.rightToLeft));
                          },
                          style: TextButton.styleFrom(
                            primary: kPrimaryAccentColor,
                            backgroundColor: kPrimaryAccentColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            elevation: 3,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.view_list_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Expenses',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 55),
                        alignment: Alignment.topRight,
                        child: SvgPicture.asset(
                          'assets/images/pay.svg',
                          height: 100,
                          width: 100,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        image: DecorationImage(
                            image: AssetImage("assets/images/bg1.png"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x4B6D6679),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const SendMoneyScreen(),
                                  type: PageTransitionType.rightToLeft));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          elevation: 0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 5),
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'assets/images/send_money.png',
                                height: 70,
                                width: 60,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 15, left: 40, right: 40),
                              child: Text(
                                '   Send   ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: kPrimaryAccentColor,
                        image: DecorationImage(
                            image: AssetImage("assets/images/bg2.png"), fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x4B6D6679),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: const ReceiveMoneyScreen(),
                                  type: PageTransitionType.rightToLeft));
                        },
                        style: TextButton.styleFrom(
                          primary: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          elevation: 0,
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 5),
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'assets/images/receive_money.png',
                                height: 70,
                                width: 60,
                              ),
                            ),
                            Container(
                              margin:  EdgeInsets.only(top: 5, bottom: 15, left: 40, right: 40),
                              child: Text(
                                'Receive',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: (){
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      elevation: 5,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => Wrap(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Text('Pay a Business',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    MyInputField(
                                      title: 'Receiving phone number',
                                      hint: 'Enter phone number',
                                      inputType: TextInputType.phone,
                                      controller: phoneController,
                                    ),
                                    MyInputField(
                                      title: 'Amount',
                                      hint: 'Enter amount',
                                      inputType: TextInputType.number,
                                      controller: amountController,
                                    ),
                                    MyInputField(
                                      title: 'Item purchased',
                                      hint: 'Item purchased',
                                      inputType: TextInputType.text,
                                      controller: itemPurchasedController,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      height: 43,
                                      child: TextButton(
                                        onPressed: () {
                                          int phone = int.parse(phoneController.text.trim());
                                          int amount =
                                          int.parse(amountController.text.trim());
                                          double fee = amount * 0.005;
                                          String item =
                                          itemPurchasedController.text.toString();
                                          if(phoneController.text.trim().toString().length == 9){
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                    child: ValidateTransaction(
                                                      amount: amount,
                                                      phoneNumber: phone,
                                                      itemPurchased: item,
                                                      fee: fee,
                                                      transactionType: 'Expenses',
                                                    ),
                                                    type: PageTransitionType.rightToLeft)
                                            );
                                            phoneController.clear();
                                            amountController.clear();
                                            itemPurchasedController.clear();
                                          }else {
                                            showTopSnackBar(
                                              context,
                                              const CustomSnackBar.info(
                                                backgroundColor: kPrimaryAccentColor,
                                                message:
                                                "The phone number you entered is not a valid phone number",
                                              ),
                                            );
                                          }
                                        },
                                        style: TextButton.styleFrom(
                                          primary: kPrimaryAccentColor,
                                          backgroundColor: kPrimaryAccentColor,
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(30))),
                                          elevation: 3,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.payments,
                                              size: 25,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Make Payment',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 270,)
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(20),
                    height: 110,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/bg3.png"), fit: BoxFit.cover),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x4B6D6679),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )
                        ],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/pay_business.png',
                              height: 58,
                              width: 58,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10,),
                                  Container(
                                    width: 120,
                                    child: Text(
                                      'Pay a Business',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Container(
                                    width: 200,
                                    child: const Text(
                                      'Payment made to any business is categorized as Expenses',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white54
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(20),
                  height: 135,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4B6D6679),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        )
                      ],
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/shopping.png',
                            height: 60,
                            width: 60,
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Container(
                                  width: 160,
                                  child: Text(
                                    'Shopping list',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 200,
                                  child: const Text(
                                    'Generate shopping lists to easily make payments to items purchased while in a market or shop',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white54
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
