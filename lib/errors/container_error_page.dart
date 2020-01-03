import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

///[GestureDetector]包裹[Container]时，点击作用默认是作用在子元素上，
///如果[Container]有颜色，因为是不透明的，所以点击事件会作用在整体，
///如果[Container]没有颜色，默认是透明的，[GestureDetector]是捕捉不到[onTap]事件的，需要加上[behavior: HitTestBehavior.opaque],

class ContainerErrorPage extends StatefulWidget {
  @override
  _ContainerErrorPageState createState() => _ContainerErrorPageState();
}

class _ContainerErrorPageState extends State<ContainerErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('container占满宽度'),),
        body: Column(
          children: <Widget>[
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                print('clickContainer');
              },
              child: 
              Container(
                alignment: Alignment.center,
                height: 40,


                // color: Colors.red,
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.blue,
                )
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}