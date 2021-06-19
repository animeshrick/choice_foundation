import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/centersModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NonTechnicalCenters extends StatefulWidget {
  @override
  _NonTechnicalCentersState createState() => _NonTechnicalCentersState();
}

class _NonTechnicalCentersState extends State<NonTechnicalCenters> {
  var _nontechData = CenterModel(
          technicalCenterData: [],
          nontechnicalCenterData: [],
          msg: '',
          responseCode: 1)
      .obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      nontechnicalCenters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var data = _nontechData.value.nontechnicalCenterData;
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
                        '${data[index].centerName}',
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child:
                              customText('${data[index].address}', black, 14.0),
                        )),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }));
  }

  void nontechnicalCenters() async {
    showProgress(context);
    _nontechData.value = (await networkcallService.getCenters())!;
    hideProgress(context);
  }
}
