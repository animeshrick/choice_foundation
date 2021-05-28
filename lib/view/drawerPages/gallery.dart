import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Gallery extends StatelessWidget {
  List<String> images = [
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
        "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
        "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png",
    "https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leadingWidth: 40,
                  leading: CircleAvatar(
                      backgroundColor: white,
                      // radius: 15,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: red,
                          ))),
                  pinned: true,
                  expandedHeight: 150.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text('Gallery'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              // physics: NeverScrollableScrollPhysics(),
              child: Container(
                  height: 1.sh,
                  width: 1.sw,
                  padding: EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: images.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 30.0,
                        mainAxisSpacing: 30.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(images[index]);
                    },
                  )),
            )));
  }
}
