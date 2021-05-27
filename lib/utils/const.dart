import 'package:flutter/material.dart';

/// ---------------------- image -------------
final String img1 = 'assets/1.png';
final String imgLogo = 'assets/imgLogo.png';
final String appBar = 'assets/appBar.png';

/// --------------- static text --------------------
final String aboutUsText =
    'Our organization is an autonomous institution registered under the GOVT.OF West Bengal, REG NO-IV190300620 based on TR ACT1882, GOVT.OF INDIA. We provide courses on unique key fields available for everyone who is interested. It is especially for people those who want to begin their career or those who want to restart their career again. We provide a flexible and affordable learning program for all interested students. Our promise to the students is to deliver an exceptional educational experience to them. Our students learn various new sets of skills from our courses, and especially as we are a government registered institution these courses come within an affordable range. Grasp this massive opportunity and we will assist you in this and help you to move forward towards your dream career. We are one of the best vocational training institute of West Bengal.';
final String donationText = 'You can donate any amount to us using any online payment method. we accept Paytm, Phonepe, Gpay Below are the required details Thank You. ';

/*-------------------------custom text-------------------------*/
TextStyle customizeTextStyle(fontWeight, fontSize, fontColor) => TextStyle(
    fontWeight: fontWeight,
    wordSpacing: 3,
    color: fontColor,
    fontSize: fontSize);

Widget customText(String text, Color color, double size, {fontWeight}) {
  return Text(text,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight));
}

Widget customInkWellText(
    Function() onTap, String text, Color color, double size,
    {fontWeight}) {
  return InkWell(
    onTap: onTap,
    child: Text(text,
        style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight)),
  );
}

Widget customUnderlineText(String text, Color color, double size,
    {fontWeight}) {
  return Text(text,
      style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ));
}

/// ------------------ color ----------------
final Color violet = Colors.purple;
final Color indigo = Colors.indigo;
final Color black = Colors.black;
final Color grey = Colors.grey;
final Color yellow = Colors.yellow;
final Color orange = Colors.orange;
final Color red = Colors.red;

final Color white = Colors.white;
final Color btnColor = Color(0xff88B91F);
