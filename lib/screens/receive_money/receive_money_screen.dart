import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../constants.dart';

class ReceiveMoneyScreen extends StatefulWidget{
  const ReceiveMoneyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ReceiveMoneyScreen();


}

class _ReceiveMoneyScreen extends State<ReceiveMoneyScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text('Receive Money',
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
          const SizedBox(height: 30,),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, right: 10),
            child: const Text(
              'Let the sender scan this QR code',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(35),
              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(
                    color: Color(0x4B6D6679),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0,
                  )],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 1, color: kBorderColor)
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  QrImage(
                    data: '677730204 Mbah Javis',
                    version: 2,
                    size: 250,
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    'Let the sender scan this QR code',
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }

}