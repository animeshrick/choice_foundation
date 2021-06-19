import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/resultModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  TextEditingController regNoCtrl = TextEditingController();

  var _result = ResultModel(data: ResultData(), msg: '', responseCode: 1).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
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
                    title: Text('Result'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 0.15.sh,
                      ),
                      textField(regNoCtrl, 'Registation Number :'),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      button(() {
                        if (regNoCtrl.text.isEmpty) {
                          Get.snackbar(
                            "Registation Number is empty",
                            "Please enter a valid Registation Number",
                            colorText: red,
                            icon: Icon(Icons.close),
                            shouldIconPulse: true,
                            onTap: (val) {},
                            barBlur: 20,
                            isDismissible: true,
                            duration: Duration(seconds: 3),
                          );
                        } else {
                          showResult();
                        }
                      }, 'SUBMIT'),
                      SizedBox(
                        height: 40,
                      ),
                      Obx(
                        () => _result.value.data!.id != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText('Your Result', black, 20.0,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  customText(
                                      'Student Name - ${_result.value.data!.studentName}',
                                      black,
                                      16.0),
                                  customText(
                                      'Registration Number - ${_result.value.data!.registrationNumber}',
                                      black,
                                      16.0),
                                  customText(
                                      'Name of Center - ${_result.value.data!.nameOfCenter}',
                                      black,
                                      16.0),
                                  _result.value.data!.status == 'Active'
                                      ? Row(
                                          children: [
                                            customText('Student Status - ',
                                                black, 16.0),
                                            customText(
                                                '${_result.value.data!.status}',
                                                green,
                                                16.0),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            customText('Student Status - ',
                                                black, 16.0),
                                            customText(
                                                '${_result.value.data!.status}',
                                                red,
                                                16.0),
                                          ],
                                        ),
                                  _result.value.data!.result == 'Pass'
                                      ? Row(
                                          children: [
                                            customText('Result Status - ',
                                                black, 16.0),
                                            customText(
                                                '${_result.value.data!.result}',
                                                Colors.green,
                                                18.0),
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            customText('Result Status - ',
                                                black, 16.0),
                                            customText(
                                                '${_result.value.data!.result}',
                                                red,
                                                18.0),
                                          ],
                                        ),
                                ],
                              )
                            : SizedBox(
                                height: 5,
                              ),
                      )
                    ],
                  )),
            )));
  }

  void showResult() async {
    showProgress(context);
    var result2 = await networkcallService.getResultAPICall(regNoCtrl.text);
    if (result2 != null) {
      _result.value = result2;
      regNoCtrl.clear();
    }
    hideProgress(context);
  }
}
