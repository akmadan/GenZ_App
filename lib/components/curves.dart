import 'package:flutter/material.dart';
import 'package:genz/utils/colors.dart';

class TopRight extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(409 * _xScaling, 142.5 * _yScaling);
    path.cubicTo(
      386.2 * _xScaling,
      51.7 * _yScaling,
      127.5 * _xScaling,
      10 * _yScaling,
      1 * _xScaling,
      0.5 * _yScaling,
    );
    path.cubicTo(
      1 * _xScaling,
      0.5 * _yScaling,
      409 * _xScaling,
      0.5 * _yScaling,
      409 * _xScaling,
      0.5 * _yScaling,
    );
    path.cubicTo(
      409 * _xScaling,
      0.5 * _yScaling,
      409 * _xScaling,
      142.5 * _yScaling,
      409 * _xScaling,
      142.5 * _yScaling,
    );
    path.cubicTo(
      409 * _xScaling,
      142.5 * _yScaling,
      409 * _xScaling,
      142.5 * _yScaling,
      409 * _xScaling,
      142.5 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TopCenter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(199.921 * _xScaling, 134.913 * _yScaling);
    path.cubicTo(
      122.203 * _xScaling,
      200.869 * _yScaling,
      34.9245 * _xScaling,
      186.379 * _yScaling,
      1 * _xScaling,
      170.889 * _yScaling,
    );
    path.cubicTo(
      1 * _xScaling,
      170.889 * _yScaling,
      1 * _xScaling,
      1 * _yScaling,
      1 * _xScaling,
      1 * _yScaling,
    );
    path.cubicTo(
      1 * _xScaling,
      1 * _yScaling,
      423 * _xScaling,
      1 * _yScaling,
      423 * _xScaling,
      1 * _yScaling,
    );
    path.cubicTo(
      423 * _xScaling,
      1 * _yScaling,
      423 * _xScaling,
      66.4572 * _yScaling,
      423 * _xScaling,
      66.4572 * _yScaling,
    );
    path.cubicTo(
      381.023 * _xScaling,
      61.7936 * _yScaling,
      277.639 * _xScaling,
      68.9556 * _yScaling,
      199.921 * _xScaling,
      134.913 * _yScaling,
    );
    path.cubicTo(
      199.921 * _xScaling,
      134.913 * _yScaling,
      199.921 * _xScaling,
      134.913 * _yScaling,
      199.921 * _xScaling,
      134.913 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class BottomLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(413.5 * _xScaling, 1.5 * _yScaling);
    path.cubicTo(
      342.3 * _xScaling,
      82.3 * _yScaling,
      108.5 * _xScaling,
      109.833 * _yScaling,
      0.5 * _xScaling,
      113.5 * _yScaling,
    );
    path.cubicTo(
      0.5 * _xScaling,
      113.5 * _yScaling,
      413.5 * _xScaling,
      113.5 * _yScaling,
      413.5 * _xScaling,
      113.5 * _yScaling,
    );
    path.cubicTo(
      413.5 * _xScaling,
      113.5 * _yScaling,
      413.5 * _xScaling,
      1.5 * _yScaling,
      413.5 * _xScaling,
      1.5 * _yScaling,
    );
    path.cubicTo(
      413.5 * _xScaling,
      1.5 * _yScaling,
      413.5 * _xScaling,
      1.5 * _yScaling,
      413.5 * _xScaling,
      1.5 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
