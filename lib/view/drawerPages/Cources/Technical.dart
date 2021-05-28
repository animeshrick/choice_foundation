import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_edu_app_121698/utils/const.dart';

class Technical extends StatefulWidget {
  @override
  _TechnicalState createState() => _TechnicalState();
}

class _TechnicalState extends State<Technical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              //  shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(20)),
              child: Container(
                //  color: white,
                height: 0.30.sh,
                width: 0.98.sw,
                child: Column(
                  children: [
                    Container(
                      color: orange,
                      height: 30,
                      width: 0.98.sw,
                      child: Text(
                        'Computer',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "A computer is a machine that can store and process information. Most computers rely on a binary system that uses two variables, 0 and 1, to complete tasks such as storing data, calculating algorithms, and displaying information."),
                    ),
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
                            children: [Text("Duration"), Text("5 year")],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Text("Course Fees"), Text("500")],
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
      ),
    );
  }
}
