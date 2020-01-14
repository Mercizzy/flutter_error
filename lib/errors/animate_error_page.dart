import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../try/animate_try_page.dart';

class AnimateErrorPage extends StatefulWidget {
  @override
  _AnimateErrorPageState createState() => _AnimateErrorPageState();
}

class _AnimateErrorPageState extends State<AnimateErrorPage> with TickerProviderStateMixin{
  var _a1 = Alignment.centerLeft;

  AnimationController _animationController;
  Animation<double> _animation;
  Animation _curve;

  AnimationController _animationController2;
  Animation<Color> _animation2;

  BoxDecoration _boxDecoration = BoxDecoration(color: Colors.red);

  double _left = 0.0;
  double _top = 0.0;

  @override
  void initState() { 
    super.initState();
    
    _animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    _curve = CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn);
    _animation = Tween(begin: 20.0, end: 100.0).animate(_curve)..addListener(() {
      setState(() {
      });
    });

    _animationController2 = AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation2 = ColorTween(begin: Colors.blue, end: Colors.red).animate(_animationController2);
    _animation2.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        _animationController2.reverse();
      }else if(status == AnimationStatus.dismissed) {
        _animationController2.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('动画'),),
        body: ListView(
          children: <Widget>[
            _customAniamteAlign(),
            _basicAnimate(),
            _useAniBuilder(),
            AnimateBox(
              boxDecoration: _boxDecoration, 
              duration: Duration(milliseconds: 2000),
              child: Container(
                height: 100,
                // decoration: BoxDecoration(
                //   color: Colors.blue
                // ),
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 40,
                  color: Colors.blue,
                ),
                AnimatePositionBox(
                  duration: Duration(milliseconds: 2000),
                  left: _left,
                  top: _top,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.red,
                  ),
                ),
                AnimatePositionBox(
                  duration: Duration(milliseconds: 2000),
                  left: _left+20.0,
                  top: _top,
                  child: AnimateBox(
                    boxDecoration: _boxDecoration, 
                    duration: Duration(milliseconds: 2000),
                    child: Container(
                      width: 20,
                      height: 20,
                      // color: Colors.yellowAccent,

                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _animationController.forward();
            _animationController2.forward();
            _boxDecoration = BoxDecoration(
              color: Colors.yellowAccent
            );
            _left = 200.0;
            _top = 20.0;
          },
          child: Icon(Icons.pause),
        ),
      ),
    );
  }

  Widget _customAniamteAlign() {
    return InkWell(
      onTap: () {
        setState(() {
          if(_a1 == Alignment.centerLeft) {
            _a1 = Alignment.centerRight;
          }else {
            _a1 = Alignment.centerLeft;
          }
        });
      },
      child: Container(
        height: 36,
        color: Colors.red,
        child: AnimatedAlign(
          duration: Duration(milliseconds: 500),
          child: Icon(Icons.search),
          alignment: _a1,
        ),
      ),
    );

  }

  ///基础运动
  Widget _basicAnimate() {
    return Container(
      height: _animation.value,
      color: Colors.yellowAccent,
    );
  }

  ///使用animationBuilder
  Widget _useAniBuilder() {
    return AnimatedBuilder(
      animation: _animation2,
      // child: Container(),   //用于封装时，传递要动画的组件
      builder: (context, child) {
        return Container(
          height: 100,
          color: _animation2.value,
          // child: child,  //用于封装时，传递要动画的组件
        );
      },
    );
  }

}