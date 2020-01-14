import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// class RebuildErrorPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     print('---------------------------------------静态state----------------------------------------------');
//     return Container(
//       child: Scaffold(
//         appBar: AppBar(title: Text('静态根stateless和stateful'),),
//         body: Column(
//           children: <Widget>[
//             ChildOne(),
//             ChildTwo(),
//           ],
//         ),
//       )
//     );
//   }
// }

class RebuildErrorPage extends StatefulWidget {
  @override
  _RebuildErrorPageState createState() => _RebuildErrorPageState();
}

class _RebuildErrorPageState extends State<RebuildErrorPage> {
  String p1 = '111';

  @override
  Widget build(BuildContext context) {
    print('---------------------------------------动态state-------------------------------------------------');
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('动态根stateless和stateful'),),
        body: Column(
          children: <Widget>[
            ChildOne(p1),
            ChildTwo(),
            ChildThree(),
            RaisedButton(
              onPressed: () {
                setState(() {
                  p1 = '2222';
                });
              },
              child: Text('本地按钮1$p1'),
            ),
            b2(),

          ],
        ),
      )
    );
  }
  Widget b2() {
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            p1 = '33333';
          });
        },
        child: Text('按钮2'),
      ),
    );
  }
}

class ChildOne extends StatefulWidget {
  final String p1;
  ChildOne(this.p1);

  @override
  _ChildOneState createState() => _ChildOneState();
}

class _ChildOneState extends State<ChildOne> {
  String p1;
  @override
  Widget build(BuildContext context) {
    print('----------------------------------------childOne----------------------------------------------');
    p1 = widget.p1;
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            p1 = '44444';
          });
        },
        child: Text('childOne${widget.p1}'),
      ),
    );
  }
}

class ChildTwo extends StatefulWidget {
  @override
  _ChildTwoState createState() => _ChildTwoState();
}

class _ChildTwoState extends State<ChildTwo> {
  @override
  Widget build(BuildContext context) {
    print('----------------------------------------childTwo------------------------------------------------');
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {
            
          });
        },
        child: Text('childTwo'),
      ),
    );
  }
}

class ChildThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('----------------------------------------childThree---------------------------------------------');
    return Container(
      child: RaisedButton(
        onPressed: () {},
        child: Text('childThree'),
      ),
    );
  }
}