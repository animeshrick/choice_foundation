import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController occuCtrl = TextEditingController();

  TextEditingController addCtrl = TextEditingController();

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
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
                    title: Text('Donation'),
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
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(donationText, black, 16),
              SizedBox(
                height: 30,
              ),
              textField(firstNameController, 'First Name : '),
              textField(lastNameController, 'Last Name : '),
              textField(occuCtrl, 'Occupation : '),
              // customText('Occupation', black, 18),
              // SizedBox(
              //   height: 0.1.sh,
              //   child: Card(
              //     color: Color(0xffE8E8E8),
              //     child: Padding(
              //       padding: const EdgeInsets.only(left: 10.0, right: 15),
              //       child: DropdownButtonHideUnderline(
              //         child: DropdownButton<String>(
              //           value: 'Select your  Occupation',
              //           elevation: 16,
              //           icon: Icon(Icons.arrow_drop_down_circle),
              //           isExpanded: true,
              //           items: <String>['Select your  Occupation', 'Dept2']
              //               .map((e) {
              //             return DropdownMenuItem(
              //               value: e,
              //               child: Text(e),
              //             );
              //           }).toList(),
              //           onChanged: (value) {},
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              textField(addCtrl, 'Address : '),
              SizedBox(
                height: 20,
              ),
              button(() {
                if (firstNameController.text.isEmpty) {
                  Get.snackbar(
                    "Firstname is empty",
                    "Please enter a your Firstname",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                }
                dontaionForm();
              }, "SUBMIT"),
              SizedBox(
                height: 0.05.sh,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void dontaionForm() async {
    showProgress(context);
    var _result = await networkcallService.getDontaionAPICall(
        firstNameController.text,
        lastNameController.text,
        occuCtrl.text,
        addCtrl.text);
    hideProgress(context);
    if (_result!) {
      firstNameController.clear();
      lastNameController.clear();
      occuCtrl.clear();
      addCtrl.clear();
      Get.snackbar('title', 'message');
    }
  }
}
