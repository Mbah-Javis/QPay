import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qpay/constants.dart';
import 'package:qpay/database/transaction_controller.dart';
import 'package:qpay/screens/home/favorites_page.dart';
import 'package:qpay/screens/home/transaction_page.dart';
import 'package:qpay/screens/home/user_page.dart';

import 'home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _taskController = Get.put(TransactionController());

  @override
  void initState() {
    super.initState();
    _taskController.getTransactions();
    print(_taskController.transactionList.length.toString());
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    HomePage(),
    TransactionsPage(),
    HomePage(),
    FavoritesPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          //backgroundColor: kPrimaryColor,
          body: IndexedStack(
            index: _selectedIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            iconSize: 25,
            backgroundColor: kLightWhiteColor,
            type : BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, color: kLightColor),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Icon(Icons.home_filled, color: kPrimaryColor,),
                ),
                icon: Icon(Icons.home_filled, color: Colors.black26,),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Icon(Icons.update, color: kPrimaryColor,),
                ),
                icon: Icon(Icons.update, color: Colors.black26,),
                title: Text('Transactions'),
              ),
              BottomNavigationBarItem(
                activeIcon: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset('assets/images/scan.png', height: 40,),
                ),
                icon: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      //Navigator.push(context, PageTransition(child: CScreen(), type: PageTransitionType.bottomToTop));
                    },
                    child: Image.asset('assets/images/scan.png', height: 40,),
                  ),
                ),
                title: Text('', style: TextStyle(fontSize: 0)),
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Icon(Icons.favorite, color: kPrimaryColor,),
                ),
                icon: Icon(Icons.favorite, size: 25, color: Colors.black26,),
                title: Text('Favorites'),
              ),
              BottomNavigationBarItem(
                activeIcon: Container(
                  child: Icon(Icons.person, color: kPrimaryColor,),
                ),
                icon: Icon(Icons.person, color: Colors.black26,),
                title:Text('Me'),
              ),
            ],
            currentIndex: _selectedIndex, //New
            onTap: _onItemTapped,
          ),
        ),
        value: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent
        )
    );
  }
}
