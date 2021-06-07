import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/coursesModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NonTechnical extends StatefulWidget {
  @override
  _NonTechnicalState createState() => _NonTechnicalState();
}

class _NonTechnicalState extends State<NonTechnical> {
  var _nontechCourseData = CourseModel(
          technicalCourseData: [],
          nontechnicalCourseData: [],
          msg: '',
          responseCode: 1)
      .obs;

  @override
  void initState() {
    super.initState();
    nontechnicalCourse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var data = _nontechCourseData.value.nontechnicalCourseData;
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                width: 0.98.sw,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      color: orange,
                      height: 30,
                      width: 0.98.sw,
                      child: Text(
                        '${data[index].courseName}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: customText(
                              '${data[index].courseDetails}', black, 14.0),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText('Duration', btnColor, 16),
                              customText('${data[index].courseDuration}',
                                  btnColor, 16),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText('Course Fee', btnColor, 16),
                              customText(
                                  'Rs.${data[index].courseFee}', btnColor, 16),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }));
  }

  void nontechnicalCourse() async {
    _nontechCourseData.value = (await networkcallService.getCoursesAPICall())!;
  }
}
