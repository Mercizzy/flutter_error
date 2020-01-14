import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_error/errors/textfield_error_page.dart';
// import 'package:flutter_error/pages/home_page.dart';

class StateErrorPage extends StatefulWidget {
  @override
  _StateErrorPageState createState() => _StateErrorPageState();
}

class _StateErrorPageState extends State<StateErrorPage> {
  String _title = 'state';
  @override
  Widget build(BuildContext context) {
    print('----------------------------------state页面build--------------------------------------');
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('$_title'),),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                _title = 'setStateTitle';
                setState(() {
                  _title = 'setStateTitleMiddle';
                });
                // Future.delayed(Duration(milliseconds: 0), () {
                  _title = 'setStateTitleBack';
                // });
                
              },
              child: Text('setState'),    
            ),

            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> TextFieldErrorPage()
                ));
                
              },
              child: Text('回去'),    
            ),
          ],
        )
      ),
    );
  }
}