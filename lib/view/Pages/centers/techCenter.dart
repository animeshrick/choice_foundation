import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/centersModel.dart';
import 'package:info_edu_app_121698/model/coursesModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:get/get.dart';

class TechnicalCenters extends StatefulWidget {
  @override
  _TechnicalCentersState createState() => _TechnicalCentersState();
}

class _TechnicalCentersState extends State<TechnicalCenters> {
  var _techData = CenterModel(
          technicalCenterData: [],
          nontechnicalCenterData: [],
          msg: '',
          responseCode: 1)
      .obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      technicalCenters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Obx(() {
      var data = _techData.value.technicalCenterData;
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
                        child:
                            customText('${data[index].address}', black, 14.0)),
                    SizedBox(
                      height: 10,
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

  void technicalCenters() async {
    showProgress(context);
    _techData.value = (await networkcallService.getCenters())!;
    hideProgress(context);
  }
}
