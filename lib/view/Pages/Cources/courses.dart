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
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                leadingWidth: 45,
                leading: Container(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                      backgroundColor: white,
                      // radius: 15,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: red,
                            size: 20,
                          ))),
                ),
                pinned: true,
                expandedHeight: 150.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  // title: Text('Apply Franchies'),
                  background: Image.asset(
                    appBar,
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: TabBar(
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  tabs: [
                    Tab(text: "Technical"),
                    Tab(text: "Non-Technical"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Technical(),
              NonTechnical(),
            ],
          ),
        ),
      ),
    );
  }
}
