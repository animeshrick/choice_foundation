import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// ---------------------- image -------------
final String img1 = 'assets/1.png';
final String imgLogo = 'assets/imgLogo.png';
final String appBar = 'assets/appBar.png';
final String bridalImg =
    'https://www.kapilssalon.com/wp-content/uploads/2019/08/k.jpg';

/// --------------- static text --------------------
final String internetError = "Please check your Internet! 😢";
final String aboutUsText =
    'Our organization is an autonomous institution registered under the GOVT.OF West Bengal, REG NO-IV190300620 based on TR ACT1882, GOVT.OF INDIA. We provide courses on unique key fields available for everyone who is interested. It is especially for people those who want to begin their career or those who want to restart their career again. We provide a flexible and affordable learning program for all interested students. Our promise to the students is to deliver an exceptional educational experience to them. Our students learn various new sets of skills from our courses, and especially as we are a government registered institution these courses come within an affordable range. Grasp this massive opportunity and we will assist you in this and help you to move forward towards your dream career. We are one of the best vocational training institute of West Bengal.';
final String donationText =
    'You can donate any amount to us using any online payment method. we accept Paytm, Phonepe, Gpay Below are the required details Thank You. ';
final String bridalText =
    'Top bridal makeup artist in West Bengal best bridal makeup artist in Kolkata nikita bridal makeup artist best makeup krushhh by konica namrata suryvanshi bridal makeup best Bridal Makeup Stylish MakeoverBest ';

final String freText =
    'REGD. NO. : 190300620 IN TR ACT 1882, GOVT. OF INDIA\nBenachity, Durgapur - 713213, Paschim Bardhaman\nMob. : 6295584343 / 8972263758\nEmail : choicefoundationdgp@gmail.com';
/*-------------------------custom text-------------------------*/
TextStyle customizeTextStyle(fontWeight, fontSize, fontColor) => TextStyle(
    fontWeight: fontWeight,
    wordSpacing: 3,
    color: fontColor,
    fontSize: fontSize);

Widget customText(String text, Color color, double size, {fontWeight}) {
  return Text(text,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: size, color: color, fontWeight: fontWeight));
}

///-----------------------font size----------------------
final double fontSizeEleven = 11.0;
final double twelve = 12.0;
final double fourteen = 14.0;
final double fontSizeEighteen = 18.0;
final double fontSizeFifteen = 15.0;
final double fontSizesixteen = 16.0;

final double fontSizeTwenty = 20.0;
final double twentytwo = 22.0;
final double twentyfour = 24.0;
final double twentyfive = 25.0;
final double thirty = 25.0;
final double thirtyfive = 25.0;
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
final Color green = Colors.green;

/* ---------------------- response code ---------------- */
var success = 1;

/* ------------------ apis ------------------------ */
final String baseUrl = 'http://choice-foundation.co.in/api/v1';
final String aboutUs = '$baseUrl/about-us';
final String contactUs = '$baseUrl/contact-us';
final String contact = '$baseUrl/contact';
final String gallery = '$baseUrl/gallery';
final String applyfranchise = '$baseUrl/apply-franchise';
final String banner = '$baseUrl/banner';
final String course = '$baseUrl/course';
final String result = '$baseUrl/result';
final String btnImages = '$baseUrl/image';
final String dontaion = '$baseUrl/donation';
final String serviceDetails = '$baseUrl/service-details';
final String studentForm = '$baseUrl/student-application';
final String allCourses = '$baseUrl/all-course';
final String center = '$baseUrl/center';
final String makeUp = '$baseUrl/makeup';
final String bridal = '$baseUrl/bridal-booking';
final String bridalBanner = '$baseUrl/beautician';
final String members = '$baseUrl/member';
final String tc = '$baseUrl/terms-and-condition';
final String regDet = '$baseUrl/registration-details';

/*-------------------------Fluttertoast-------------------------*/

showToast(msg, color) => Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.SNACKBAR,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: white,
    fontSize: 16.0);

showProgress(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: CupertinoActivityIndicator(
            radius: 25,
          ),
        );
      },
      barrierDismissible: false);
}

void hideProgress(BuildContext context) {
  Navigator.pop(context);
}
