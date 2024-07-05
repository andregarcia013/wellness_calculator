import 'package:flutter/widgets.dart';

extension PaddingWidget on Widget {
  Widget paddingOnly(
      {double top = 0, double bottom = 0, double left = 0, double right = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(top: top, bottom: bottom, right: right, left: left),
      child: this,
    );
  }
}
