import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';

class ExpensesScreen extends StatefulWidget{
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExpensesScreen();

}

class _ExpensesScreen extends State<ExpensesScreen>{

  final DateTime _selectedDate = DateTime.now();

  late int _selectedIndex;
  final List<String> _options = ['January', 'February', 'March', 'April', 'May', 'June', 'July',
    'August', 'September', 'October','November', 'December'];

  Widget _buildChips() {
    List<Widget> chips = List.empty();

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        elevation: 10,
        pressElevation: 5,
        shadowColor: kLightColor,
        backgroundColor: Colors.pink,
        selectedColor: Colors.blue,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
            }
          });
        },
      );

      chips.add(Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: choiceChip
      ));
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
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
                        'Expenses',
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

                /*Container(
                  margin: const EdgeInsets.only(top: 8, right: 5, left: 5),
                  padding: const EdgeInsets.all(10),
                  child: DatePicker(
                    DateTime.utc(DateTime.now().year),
                    height: 100,
                    width: 80,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: kPrimaryColor,
                    selectedTextColor: Colors.white,
                    dateTextStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey
                    ),
                    onDateChange: (date){
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),*/
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