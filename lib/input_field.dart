import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class MyInputField extends StatelessWidget{
  final String title;
  final String hint;
  final String? initialText;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Widget? widget;

  const MyInputField({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,
    required this.inputType,
    this.initialText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500
              //fontWeight: FontWeight.w900
            ),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: initialText,
                    readOnly: widget==null ? false : true,
                    keyboardType: inputType,
                    validator: (value) => value!.isNotEmpty ? null : "Field required!",
                    autofocus: false,
                    cursorColor: kPrimaryColor,
                    controller: controller,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ) ,
                ),
                widget == null ? Container() : Container(
                  child: widget,
                )
              ],
            ),
          )
        ],
      ),
    );
  }


}