import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qpay/constants.dart';
import 'package:qpay/input_field.dart';
import 'package:qpay/screens/validate_transaction/validate_transaction.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage();

}

class _HomePage extends State<HomePage>{

  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController itemPurchasedController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top:60),
                  alignment: Alignment.topCenter,
                  child: Text('QPay',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                    width: 42,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kLightColor,
                      boxShadow: const [BoxShadow(
                        color: Colors.deepPurple,
                        offset: Offset(0.0, 1.0),
                        blurRadius: 6.0,
                      ),],
                      borderRadius: BorderRadius.circular(25),
                    ),
                    margin: EdgeInsets.only(top: 50, left: 20),
                    alignment: Alignment.topLeft,
                    child: Icon(
                      Icons.menu_rounded,
                      size: 25,
                      color: Colors.white,
                    )
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  alignment: Alignment.topRight,
                  child:  SvgPicture.asset('assets/images/money.svg', height: 40, width: 40,),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 130, left: 20),
                      child: const Text('130,550 XAF',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                    Container(
                        width: 40,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: kGreenColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.only(top: 130, left: 15),
                        child: Text('+10', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),)
                    ),
                  ],
                ),
                Container(
                  width: 140,
                  margin: EdgeInsets.only(top: 190, left: 20),
                  child: TextButton(
                    onPressed: () {  },
                    style:TextButton.styleFrom(
                      primary: kPrimaryAccentColor,
                      backgroundColor: kPrimaryAccentColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                      elevation: 3,
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 10,),
                        Icon(
                          Icons.money_rounded,
                          size: 25,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10,),
                        Text('Expenses', style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),),
                        SizedBox(width: 10,),
                      ],
                    ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150),
                  alignment: Alignment.topRight,
                  child:  SvgPicture.asset('assets/images/pay.svg', height: 100, width: 100,),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {  },
                            style:TextButton.styleFrom(
                              primary: kLightWhiteColor,
                              backgroundColor: kLightWhiteColor,
                              shadowColor: kLightWhiteColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              elevation: 3,
                            ),
                            child: Row(
                              children: const [
                                SizedBox(width: 20,),
                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  size: 25,
                                  color: kLightColor,
                                ),
                                SizedBox(width: 10,),
                                Text('  Send  ', style: TextStyle(
                                  color: kLightColor,
                                  fontSize: 18,
                                ),),
                                SizedBox(width: 20,),
                              ],
                            ),

                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {  },
                            style:TextButton.styleFrom(
                              primary: kLightWhiteColor,
                              backgroundColor: kLightWhiteColor,
                              shadowColor: kLightWhiteColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                              ),
                              elevation: 3,
                            ),
                            child: Row(
                              children: const [
                                SizedBox(width: 20,),
                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  size: 25,
                                  color: kLightColor,
                                ),
                                SizedBox(width: 10,),
                                Text('Receive ', style: TextStyle(
                                  color: kLightColor,
                                  fontSize: 18,
                                ),),
                                SizedBox(width: 20,),
                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      margin: const EdgeInsets.all(20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(
                            color: Color(0x4B6D6679),
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          )],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: Column(children: [
                        MyInputField(title: 'Receiving number', hint: 'Enter number',
                          inputType: TextInputType.phone, controller: phoneController,),
                        MyInputField(title: 'Amount', hint: 'Enter amount',
                          inputType: TextInputType.number, controller: amountController,),
                        MyInputField(title: 'Item purchased', hint: 'Item purchased',
                          inputType: TextInputType.text, controller: itemPurchasedController,),
                        const SizedBox(height: 10,),
                        SizedBox(
                          width: 200,
                          height: 43,
                          child: TextButton(
                            onPressed: () {
                              int phone = int.parse(phoneController.text.trim());
                              int amount = int.parse(amountController.text.trim());
                              String item = itemPurchasedController.text.toString();
                              Navigator.push(context, PageTransition(
                                  child: ValidateTransaction(amount: amount, phoneNumber: phone, itemPurchased: item,),
                                  type: PageTransitionType.rightToLeft
                              )
                              );
                              phoneController.clear();
                              amountController.clear();
                              itemPurchasedController.clear();
                            },
                            style:TextButton.styleFrom(
                              primary: kPrimaryAccentColor,
                              backgroundColor: kPrimaryAccentColor,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                              elevation: 3,
                            ),
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                SizedBox(width: 10,),
                                Icon(
                                  Icons.payments,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10,),
                                Text('Make Payment', style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),),
                                SizedBox(width: 10,),
                              ],
                            ),

                          ),
                        ),
                        const SizedBox(height: 10,),
                      ],
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

}