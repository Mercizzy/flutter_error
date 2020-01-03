import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextFieldErrorPage extends StatefulWidget {
  @override
  _TextFieldErrorPageState createState() => _TextFieldErrorPageState();
}

class _TextFieldErrorPageState extends State<TextFieldErrorPage> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();

  var _a1 = Alignment.centerRight;
  var _a2 = Alignment.centerLeft;

  @override
  void initState() { 
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        setState(() {
          _a1 = Alignment.centerLeft;
          _a1 = Alignment.centerRight;
        });
      }else {
        if(_textEditingController.text == '') {
          setState(() {
            _a1 = Alignment.centerRight;
            _a2 = Alignment.centerLeft;
          });
        }
        
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      onPanCancel: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Scaffold(
          appBar: AppBar(title: Text('输入框'),),
          body: Container(
            height: 36,
            padding: EdgeInsets.only(
              left: 20,
              right: 20
            ),
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Stack(
              children: <Widget>[
                TextField(
                  focusNode: _focusNode,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    // labelText: '测试'
                    contentPadding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    border: InputBorder.none,
                  ),
                ),
                // Positioned(
                //   right: 20,
                //   child: Container(
                //     width: 20,
                //     height: 36,
                //     alignment: Alignment.center,
                //     // color: Colors.red,
                //     child: InkWell(
                //       onTap: () {
                //         setState(() {
                //           _textEditingController.text = '';
                //         });
                //       },
                //       child: Icon(CupertinoIcons.clear_thick_circled),
                //     ),
                //   ),
                // ),
                
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 36,
                        child: AnimatedAlign(
                          duration: Duration(milliseconds: 500),
                          alignment: _a1,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(CupertinoIcons.search),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 36,
                        child: AnimatedAlign(
                          duration: Duration(milliseconds: 500),
                          alignment: _a2,
                          child: InkWell(
                            onTap: () {},
                            child: Text('搜索'),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}