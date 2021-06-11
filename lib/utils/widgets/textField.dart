import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/utils/const.dart';

Widget textField(TextEditingController controller, String text,
    {TextInputType? keyboardType,String? hintText}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customText(text, black, 18),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        autofocus: false,
      
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(),
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
}
