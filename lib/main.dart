import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_error/pages/home_page.dart';

void main()=> runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    print('-----------------看看会不会触发我-------------------------');
    return Container(
      child: MaterialApp(
        title: 'flutter错题集',
        home: HomePage(),
      )
    );
  }
}