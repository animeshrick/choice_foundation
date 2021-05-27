import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

Widget button(Function() onPressed, String text) {
  return SizedBox(
      width: 1.sw,
      height: 0.075.sh,
      child: RaisedButton(
          color: btnColor,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: white, fontSize: 20),
          )));
}
