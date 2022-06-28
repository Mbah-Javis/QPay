import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qpay/constants.dart';
import 'package:qpay/database/transaction_controller.dart';
import 'package:qpay/models/transaction.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class ValidateTransaction extends StatefulWidget {
  final int phoneNumber;
  final int amount;
  final String? itemPurchased;
  final String transactionType;
  final double fee;
  const ValidateTransaction(
      {Key? key,
      required this.phoneNumber,
      required this.amount,
      this.itemPurchased,
      required this.fee,
      required this.transactionType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValidateTransaction();
}

class _ValidateTransaction extends State<ValidateTransaction> {
  List<String> mtnNumbers = [
    '650',
    '651',
    '652',
    '653',
    '654',
    '680',
    '681',
    '682',
    '683',
    '684'
  ];
  List<String> orangeNumbers = [
    '655',
    '656',
    '657',
    '658',
    '659',
    '685',
    '686',
    '687',
    '688',
    '689'
  ];
  late String provider;

  late int subscriptionId; // sim card subscription ID
  late String code;

  final TransactionController _transactionController = Get. put(TransactionController());

  @override
  void initState() {
    provider = checkNumber(widget.phoneNumber.toString());
    super.initState();
  }

  String checkNumber(String number) {
    if (number.substring(0, 2) == '67') {
      return 'mtn';
    } else if (number.substring(0, 2) == '69') {
      return 'orange';
    } else {
      int i = 0;
      for (i == 0; i <= 11; i++) {
        if (mtnNumbers[i] == number.substring(0, 3)) {
          return 'mtn';
        } else if (orangeNumbers[i] == number.substring(0, 3)) {
          return 'orange';
        }
      }
    }
    return '';
  }

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
                            Icons.clear_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )),
                    Container(
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Validate Transaction',
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
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: const Text(
                    'Your transaction',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, bottom: 10, top: 15, right: 15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x4B6D6679),
                          offset: Offset(0.0, 1.0),
                          blurRadius: 6.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: kBorderColor)),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: kBorderColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sending ',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.amount.toString() + ' XAF',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: kBorderColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'To ',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.phoneNumber.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: kBorderColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Mobile money provider ',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            provider == 'mtn'
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      'assets/images/mtn_logo.jpg',
                                      width: 40,
                                      height: 40,
                                    ),
                                  )
                                : provider == 'orange'
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          'assets/images/orange_logo.png',
                                          width: 40,
                                          height: 40,
                                        ),
                                      )
                                    : const Text(
                                        'NA',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: kBorderColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${provider.toUpperCase()} fee ',
                              style: const TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              widget.fee.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 5),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: kBorderColor))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Tax ',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '0 XAF',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(bottom: 15, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Total amount ',
                              style: TextStyle(
                                  color: kGreyColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '${widget.amount + widget.fee}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  height: 43,
                  child: widget.transactionType == 'Expenses'
                      ? TextButton(
                          onPressed: () async {
                            try {
                              if (provider == 'mtn') {
                                code =
                                    '*126*9*${widget.phoneNumber}*${widget.amount}#';
                                subscriptionId = 1;
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.QUESTION,
                                  //barrierColor: Colors.white,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: 'Transaction',
                                  desc:
                                      'Add this payment to your Transaction history?',
                                  btnCancelOnPress: () {
                                    print('cancel transaction');
                                    Navigator.pop(context);
                                  },
                                  btnOkColor: kPrimaryColor,
                                  btnCancelColor: kGreyColor,
                                  btnOkText: 'Yes',
                                  btnCancelText: 'No',
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () async {
                                    await addTransactionToDb();
                                    //Navigator.pop(context);
                                  },
                                ).show();
                                await UssdAdvanced.sendUssd(
                                    code: code, subscriptionId: subscriptionId
                                );
                              } else if (provider == 'orange') {
                                code =
                                    '#150*1*1*${widget.phoneNumber}*${widget.amount}#';
                                subscriptionId = 2;
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.QUESTION,
                                  //barrierColor: Colors.white,
                                  animType: AnimType.BOTTOMSLIDE,
                                  title: 'Transaction',
                                  desc:
                                  'Add this payment to your Transaction history?',
                                  btnCancelOnPress: () {
                                    Navigator.pop(context);
                                  },
                                  btnOkColor: kPrimaryColor,
                                  btnCancelColor: kGreyColor,
                                  btnOkText: 'Yes',
                                  btnCancelText: 'No',
                                  dismissOnTouchOutside: false,
                                  btnOkOnPress: () {
                                    addTransactionToDb();
                                    Navigator.pop(context);
                                  },
                                ).show();
                                await UssdAdvanced.sendUssd(
                                    code: code, subscriptionId: subscriptionId
                                );
                              }
                            } catch (e) {
                              //debugPrint("error! code: ${e.hashCode} - message: ${e.runtimeType}");
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
                                Icons.check_circle_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Confirm Payment',
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
                        )
                      : TextButton(
                          onPressed: () async {
                            try {
                                if (provider == 'mtn') {
                                  code =
                                      '*126*9*${widget.phoneNumber}*${widget.amount}#';
                                  subscriptionId = 1;
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.QUESTION,
                                    //barrierColor: Colors.white,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Transaction',
                                    desc:
                                    'Add this transfer to your Transaction history?',
                                    btnCancelOnPress: () {
                                      Navigator.pop(context);
                                    },
                                    btnOkColor: kPrimaryColor,
                                    btnCancelColor: kGreyColor,
                                    btnOkText: 'Yes',
                                    btnCancelText: 'No',
                                    dismissOnTouchOutside: false,
                                    btnOkOnPress: () {
                                      addTransactionToDb();
                                      Navigator.pop(context);
                                    },
                                  ).show();
                                  await UssdAdvanced.sendUssd(
                                      code: code, subscriptionId: subscriptionId);
                                } else if (provider == 'orange') {
                                  code =
                                      '#150*1*1*${widget.phoneNumber}*${widget.amount}#';
                                  subscriptionId = 2;
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.QUESTION,
                                    //barrierColor: Colors.white,
                                    animType: AnimType.BOTTOMSLIDE,
                                    title: 'Transaction',
                                    desc:
                                    'Add this transfer to your Transaction history?',
                                    btnCancelOnPress: () {
                                      Navigator.pop(context);
                                    },
                                    btnOkColor: kPrimaryColor,
                                    btnCancelColor: kGreyColor,
                                    btnOkText: 'Yes',
                                    btnCancelText: 'No',
                                    dismissOnTouchOutside: false,
                                    btnOkOnPress: () {
                                      addTransactionToDb();
                                      Navigator.pop(context);
                                      TransactionController().getTransactions();
                                    },
                                  ).show();
                                  await UssdAdvanced.sendUssd(
                                      code: code, subscriptionId: subscriptionId);
                                }

                            } catch (e) {

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
                                Icons.check_circle_rounded,
                                size: 25,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Confirm Transfer',
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
          ))
        ],
      ),
    );
  }

  addTransactionToDb() async {
    await _transactionController.addTransaction(
        userTransaction: UserTransaction(
          title: widget.itemPurchased,
          phoneNumber: widget.phoneNumber,
          date: DateFormat.yMMMd().format(DateTime.now()),
          time: DateFormat.jm().format(DateTime.now()),
          transactionType: widget.transactionType,
          amount: widget.amount,
        )
    );

  }
}
