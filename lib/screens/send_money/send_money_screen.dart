import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class SendMoneyScreen extends StatefulWidget{
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SendMoneyScreen();

}

class _SendMoneyScreen extends State<SendMoneyScreen>{
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
                       'Receive Money',
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
       ],
     ),
   );
  }

}