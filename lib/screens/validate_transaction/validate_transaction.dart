import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qpay/constants.dart';

class ValidateTransaction extends StatefulWidget{
  final int phoneNumber;
  final int amount;
  final String? itemPurchased;
  const ValidateTransaction({Key? key, required this.phoneNumber, required this.amount, this.itemPurchased}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ValidateTransaction();

}

class _ValidateTransaction extends State<ValidateTransaction>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              boxShadow: [BoxShadow(
                color: kLightColor,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
              ),],
            ),
            child: Column(
              children: [
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: kLightColor,
                          boxShadow: const [BoxShadow(
                            color: Colors.deepPurple,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6.0,
                          ),],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: EdgeInsets.only(left: 20),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            },
                        )
                    ),
                    Container(
                      //margin: EdgeInsets.only(top:60),
                      alignment: Alignment.topCenter,
                      child: Text('Validate Transaction',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      child:  SvgPicture.asset('assets/images/money.svg', height: 30, width: 30,),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
              ],
            ),
          ),
          const SizedBox(height: 50,),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
            child: Text('Your transaction',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, bottom: 10, top: 15, right: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: kBorderColor)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: kBorderColor)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sending: ',
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(widget.amount.toString()+ ' XAF',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: kBorderColor)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sending: ',
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(widget.amount.toString()+ ' XAF',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15, top: 5),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: kBorderColor)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Sending: ',
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                      Text(widget.amount.toString()+ ' XAF',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(widget.phoneNumber.toString()),
          Text(widget.amount.toString()),
          Text(widget.itemPurchased.toString()),
        ],
      ),
    );
  }

}