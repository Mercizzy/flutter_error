import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_error/errors/border_error_page.dart';
import 'package:flutter_error/errors/container_error_page.dart';
import 'package:flutter_error/errors/textfield_error_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        body: SingleChildScrollView(
          child: Wrap(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BorderErrorPage()
                  ));
                },
                child: Text('border和borderRadius'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ContainerErrorPage()
                  ));
                },
                child: Text('Container占满'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => TextFieldErrorPage()
                  ));
                },
                child: Text('TextField'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}