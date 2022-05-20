import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qpay/constants.dart';
import 'package:qpay/input_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:qpay/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QPay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'QPay'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        child: Scaffold(
          //backgroundColor: kPrimaryColor,
          body: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: TextButton(
                    onPressed: (){
                      Navigator.push(context, PageTransition(child: HomeScreen(title: 'QPay',), type: PageTransitionType.rightToLeft));
                    },
                    child: Text('Go to homescreen'))
              )
            ],
          ),
    ),
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent
        )
    );
  }
}
