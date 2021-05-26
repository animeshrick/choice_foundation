import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/utils/const.dart';

Widget textField(TextEditingController controller, String text) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customText(text, black, 18),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        controller: controller,
        autofocus: false,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
