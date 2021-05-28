import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';

import 'Non-technical.dart';
import 'Technical.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 1.sw,
                color: btnColor,
                height: 0.2.sh,
                child: Image.asset(
                  'assets/appBar.png',
                ),
              ),
              Positioned(
                top: 15,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 15,
                          color: black,
                        ),
                        onPressed: () {
                          Get.back();
                        })),
              ),
              Positioned(
                top: 0.1.sh,
                left: 0.4.sw,
                child: Center(
                  child: Text(
                    'Courses',
                    style: customizeTextStyle(
                        FontWeight.bold, twentytwo, Colors.white),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.blue,
                      tabs: [
                        Tab(
                          text: 'Technical',
                        ),
                        Tab(
                          text: 'Non-Technical',
                        )
                      ],
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Technical(),
                        NonTechnical(),
                      ]),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
