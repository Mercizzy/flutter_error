import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_error/errors/animate_error_page.dart';
import 'package:flutter_error/errors/border_error_page.dart';
import 'package:flutter_error/errors/container_error_page.dart';
import 'package:flutter_error/errors/rebuild_error_page.dart';
import 'package:flutter_error/errors/state_error_page.dart';
import 'package:flutter_error/errors/textfield_error_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = 'home';
  @override
  Widget build(BuildContext context) {
    print('--------------------------------home build--------------------------------------');
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('$_title'),
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
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AnimateErrorPage()
                  ));
                },
                child: Text('动画'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> StateErrorPage()
                  ));
                },
                child: Text('setState'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> RebuildErrorPage()
                  ));
                },
                child: Text('statelesshestateful'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}