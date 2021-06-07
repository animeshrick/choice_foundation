import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/view/dashboard.dart';
import 'package:info_edu_app_121698/view/drawerPages/Cources/courses.dart';
import 'package:info_edu_app_121698/view/drawerPages/applyFranchise.dart';
import 'package:info_edu_app_121698/view/drawerPages/bridal.dart';
import 'package:info_edu_app_121698/view/drawerPages/contactUs.dart';
import 'package:info_edu_app_121698/view/drawerPages/donation.dart';
import 'package:info_edu_app_121698/view/drawerPages/gallery.dart';
import 'package:info_edu_app_121698/view/drawerPages/result.dart';
import 'package:info_edu_app_121698/view/drawerPages/studentForm.dart';

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
        Divider(),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.home_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Home'),
            ],
          ),
          onTap: () {
            Get.off(() => Dashboard());
          },
        ),
        // ListTile(
        //   title: Row(
        //     children: [
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Icon(Icons.school_outlined),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text('Courses'),
        //     ],
        //   ),
        //   onTap: () {
        //     Get.to(() => Courses());
        //   },
        // ),
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
        // ListTile(
        //   title: Row(
        //     children: [
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Icon(Icons.star_border),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text('Apply Franchise'),
        //     ],
        //   ),
        //   onTap: () {
        //     Get.to(() => ApplyFranchise());
        //   },
        // ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.image_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Gallery'),
            ],
          ),
          onTap: () {
            Get.to(() => Gallery());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.file_copy_outlined),
              SizedBox(
                width: 30,
              ),
              Text('Result'),
            ],
          ),
          onTap: () {
            Get.to(() => ResultPage());
          },
        ),
        ListTile(
          title: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Icon(Icons.favorite_border),
              SizedBox(
                width: 30,
              ),
              Text('Donation'),
            ],
          ),
          onTap: () {
            Get.to(() => Donation());
          },
        ),
        // ListTile(
        //   title: Row(
        //     children: [
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Icon(Icons.file_copy_outlined),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text('Student Application'),
        //     ],
        //   ),
        //   onTap: () {
        //     Get.to(() => StudentForm());
        //   },
        // ),
        // ListTile(
        //   title: Row(
        //     children: [
        //       SizedBox(
        //         width: 15,
        //       ),
        //       Icon(Icons.animation),
        //       SizedBox(
        //         width: 30,
        //       ),
        //       Text('Bridal Beautition Booking'),
        //     ],
        //   ),
        //   onTap: () {
        //     Get.to(() => Bridal());
        //   },
        // ),
      ],
    ),
  );
}
