import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qpay/screens/validate_transaction/validate_transaction.dart';
import 'package:fluttercontactpicker/fluttercontactpicker.dart';

import '../../constants.dart';
import '../../input_field.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SendMoneyScreen();
}

class _SendMoneyScreen extends State<SendMoneyScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController reasonForTransfer = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  PhoneContact? _phoneContact;
  String? _contact;
  String? receivingContact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [
                BoxShadow(
                  color: kLightColor,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: 35,
                        width: 35,
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
                        margin: const EdgeInsets.only(left: 20),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Container(
                      //margin: EdgeInsets.only(top:60),
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Send Money',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        'assets/images/money.svg',
                        height: 30,
                        width: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
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
                      Container(
                        alignment: Alignment.topRight,
                        height: 50,
                        width: 50,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.deepPurple,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: IconButton(
                            onPressed: () async {
                              final PhoneContact contact =
                                  await FlutterContactPicker.pickPhoneContact();
                              setState(() {
                                if(contact.phoneNumber!.number!.substring(0,1) == '+'){
                                  String number = contact.phoneNumber!.number!.substring(4);
                                  phoneController.text = number.replaceAll(' ', '');
                                }else if(contact.phoneNumber!.number!.substring(0,1) == '2'){
                                  String number = contact.phoneNumber!.number!.substring(3);
                                  phoneController.text = number.replaceAll(' ', '');
                                }else{
                                  phoneController.text = contact.phoneNumber!.number!.replaceAll(' ', '');
                                }
                              });
                            },
                            icon: const Icon(
                              Icons.contact_phone_rounded,
                              size: 25,
                              color: Colors.white,
                            )),
                      ),
                      MyInputField(
                        title: 'Receiving number',
                        hint: 'Enter number',
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
                        title: 'Reason for transfer',
                        hint: 'Reason for transfer',
                        inputType: TextInputType.text,
                        controller: reasonForTransfer,
                      ),
                      const SizedBox(
                        height: 15,
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
                            String item = reasonForTransfer.text.toString();
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: ValidateTransaction(
                                        amount: amount,
                                        phoneNumber: phone,
                                        itemPurchased: item,
                                        fee: fee,
                                      transactionType: 'Transfer',
                                    ),
                                    type: PageTransitionType.rightToLeft));
                            phoneController.clear();
                            amountController.clear();
                            reasonForTransfer.clear();
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
                                Icons.arrow_circle_up_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Send Money',
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
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
