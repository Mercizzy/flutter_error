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
  var _o1 = 1.0;
  bool _isShowClear = true;

  @override
  void initState() { 
    super.initState();
    _focusNode.addListener(() {
      if(_focusNode.hasFocus) {
        setState(() {
          print('点击搜索框');
          _a1 = Alignment.centerLeft;
          _a2 = Alignment.centerRight;
          _o1 = 0.0;
        });
      }else {
        if(_textEditingController.text == '') {
          print('离开搜索框');
          setState(() {
            _a1 = Alignment.centerRight;
            _a2 = Alignment.centerLeft;
            _o1 = 1.0;
          });
        }
        
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        //触摸收起键盘
        print('3333');
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
                    onChanged: (str) {
                      setState(() {
                        _isShowClear = str == '';
                      });
                    },
                  ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _focusNode.requestFocus();
                        },
                        child: Container(
                          height: 36,
                          child: AnimatedAlign(
                            duration: Duration(milliseconds: 500),
                            alignment: _a1,
                            child: Icon(CupertinoIcons.search),
                          ),
                        ),
                      )
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          _focusNode.requestFocus();
                        },
                        child: Container(
                          height: 36,
                          child: AnimatedAlign(
                            duration: Duration(milliseconds: 500),
                            alignment: _a2,
                            child: AnimatedOpacity(
                              child: Text('搜索'),
                              duration: Duration(milliseconds: 500),
                              opacity: _o1,
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
                
                Positioned(
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _textEditingController.text = '';
                        _isShowClear = true;
                      });
                    },
                    child: Offstage(
                      offstage: _isShowClear,
                      child: Container(
                        height: 36,
                        child: Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}