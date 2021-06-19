import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/view/Pages/aboutUs.dart';
import 'package:info_edu_app_121698/view/Pages/contactUs.dart';
import 'package:info_edu_app_121698/view/Pages/members.dart';
import 'package:info_edu_app_121698/view/Pages/regDetails.dart';
import 'package:info_edu_app_121698/view/Pages/terms&Condition.dart';

Widget drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: CircleAvatar(
            radius: 0.2.sw,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 0.15.sw,
              child: Image.asset(imgLogo),
            ),
          ),
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.details),
              SizedBox(
                width: 30,
              ),
              Text('About Us'),
            ],
          ),
          onTap: () {
            Get.to(() => AboutUs());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.supervisor_account_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Members'),
            ],
          ),
          onTap: () {
            Get.to(() => Members());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.phone_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Contact Us'),
            ],
          ),
          onTap: () {
            Get.to(() => ContactUs());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.app_registration),
              SizedBox(
                width: 30,
              ),
              Text('Registation Details'),
            ],
          ),
          onTap: () {
            Get.to(()=>RegDetails());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.sticky_note_2_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Terms And Conditions'),
            ],
          ),
          onTap: () {
            Get.to(()=> TermsAndCondition());
          },
        ),
      ],
    ),
  );
}
