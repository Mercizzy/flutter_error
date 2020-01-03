import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///在[BoxDecoration]中，如果有[BorderRadius]，那么[border]要么为空，要么四边全有值，否则会报错

class BorderErrorPage extends StatefulWidget {
  @override
  _BorderErrorPageState createState() => _BorderErrorPageState();
}

class _BorderErrorPageState extends State<BorderErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('border与borderRadius'),),
        body: Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.pink,
            border: Border(
              top: BorderSide(color: Colors.black,width: 4),
              left: BorderSide(color: Colors.black,width: 4),
              right: BorderSide(color: Colors.black,width: 4),
              bottom: BorderSide(color: Colors.black,width: 4),
            ),
            borderRadius: BorderRadius.all(Radius.circular(15))
          )
        ),
      ),
    );
  }
}