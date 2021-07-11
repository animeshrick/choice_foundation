import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const.dart';

// Widget button(Function() onPressed, String text) {
//   return SizedBox(
//       width: 1.sw,
//       height: 0.075.sh,
//       child: RaisedButton(
//           color: btnColor,
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(color: white, fontSize: 20),
//           )));
// }
Widget button(Function() onPressed, String text) {
  return SizedBox(
      width: 1.sw,
      height: 0.075.sh,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: btnColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: customText(text, black, 16.0)));
}

Widget paybutton(Function() onPressed, String text) {
  return SizedBox(
      width: 1.sw,
      height: 0.075.sh,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          onPressed: onPressed,
          child: customText(text, black, 16.0)));
}
/*
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            onPrimary: Colors.yellow,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text('Save'),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(),
                        onPressed: () {},
                        child: Text('Save'),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(),
                        onPressed: () {},
                        child: Text('Save'),
                      ),
 */