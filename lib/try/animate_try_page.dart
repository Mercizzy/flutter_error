import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AnimateBox extends ImplicitlyAnimatedWidget  {
  final BoxDecoration boxDecoration;
  final Widget child;
  AnimateBox({
    Key key,
    @required this.boxDecoration,
    this.child,
    Curve curve = Curves.linear,
    @required Duration duration,
    Duration reverseDuration,
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
    // reverseDuration: reverseDuration,
  );
  @override
  _AnimateBoxState createState() => _AnimateBoxState();
}

class _AnimateBoxState extends AnimatedWidgetBaseState<AnimateBox> {
  DecorationTween _decorationTween;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _decorationTween = visitor(
      _decorationTween, 
      widget.boxDecoration,
      (value)=> DecorationTween(begin: value)
    );
  }
}

class AnimatePositionBox extends ImplicitlyAnimatedWidget {
  final Widget child;
  final double left;
  final double top;

  AnimatePositionBox({
    Key key,
    this.child, 
    this.left, 
    this.top,
    curve = Curves.linear,
    @required Duration duration
  }) : super(
    key: key,
    curve: curve,
    duration: duration,
  );
  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() {
    return _AnimatePositionBoxState();
  }
}

class _AnimatePositionBoxState extends AnimatedWidgetBaseState<AnimatePositionBox>{
  Tween _tween;
  Tween _tween2;
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _tween.evaluate(animation),
      top: _tween2.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _tween = visitor(
      _tween,
      widget.left,
      (value)=> Tween(begin: value)
    );
    _tween2 = visitor(
      _tween2,
      widget.top,
      (value)=> Tween(begin: value)
    );
  }
}
