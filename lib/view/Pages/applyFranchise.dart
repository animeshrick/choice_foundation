import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ApplyFranchise extends StatefulWidget {
  @override
  _ApplyFranchiseState createState() => _ApplyFranchiseState();
}

class _ApplyFranchiseState extends State<ApplyFranchise> {
  TextEditingController orgNameController = TextEditingController();
  TextEditingController applicantNameController = TextEditingController();
  TextEditingController guardianNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController contNoController = TextEditingController();
  TextEditingController permanentAddController = TextEditingController();
  TextEditingController businessController = TextEditingController();
  TextEditingController adharController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController belongCtrl = TextEditingController();
  TextEditingController eduCtrl = TextEditingController();
  String? imgPath;

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
              title: Text('Apply Franchies'),
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
              // Stack(
              //   children: [
              //     Center(
              //       child: imgPath != null
              //           ? Image.file(File(imgPath!))
              //           : CachedNetworkImage(
              //               imageUrl:
              //                   'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg',
              //               errorWidget: (context, url, error) => Text("error"),
              //               imageBuilder: (context, imageProvider) =>
              //                   CircleAvatar(
              //                 radius: 60,
              //                 backgroundImage: imageProvider,
              //               ),
              //               placeholder: (context, url) =>
              //                   CircularProgressIndicator(),
              //             ),
              //     ),
              //     Positioned(
              //       top: 80,
              //       right: 110,
              //       child: IconButton(
              //           onPressed: () {
              //             _selectImage();
              //           },
              //           icon: Icon(
              //             Icons.camera_alt_outlined,
              //             size: 35,
              //             color: grey,
              //           )),
              //     ),
              //   ],
              // ),
              customText('CHOICE FOUNDATION', black, 20.0,
                  fontWeight: FontWeight.bold),
              customText(freText, black, 18),
              SizedBox(
                height: 20,
              ),

              /// ---------------- form data ------------------
              // textField(regNoController, 'Registation Number'),
              textField(orgNameController, 'Name of the Organition'),

              /// -------------- calender ------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      child: customText(
                          'SCHEDULED DATE OF COMMENCEMENT : (DD/MM/YYYY) --',
                          black,
                          16.0)),
                  IconButton(
                      onPressed: () {
                        calender();
                      },
                      icon: Icon(Icons.calendar_today))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              textField(applicantNameController, 'Name of the Applicant'),
              textField(guardianNameController, 'Name of Parent'),
              textField(ageController, 'Age',
                  keyboardType: TextInputType.phone),

              /// ----------------- calender ------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText('Date of Birth : (DD/MM/YY) --', black, 16.0),
                  IconButton(
                      onPressed: () {
                        calender();
                      },
                      icon: Icon(Icons.calendar_today))
                ],
              ),
              textField(contNoController, 'Contact Number',
                  keyboardType: TextInputType.number),

              // /// --------------- checkbox ------------
              // customText('Whether belong to:', black, 16.0),
              // Checkbox(value: false, onChanged: (val) {}),
              // customText('Educational Qualification :', black, 16.0),
              // Checkbox(value: false, onChanged: (val) {}),
              textField(belongCtrl, 'Whether belong to :'),
              textField(eduCtrl, 'Educational Qualification :'),
              textField(permanentAddController, 'Permanent Address'),
              textField(businessController, 'Nature of Business'),
              textField(adharController, 'Adharcard Number'),
              textField(placeController, 'Place'),

              /// ------------ calender --------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText('Date :', black, 16.0),
                  IconButton(
                      onPressed: () {
                        calender();
                      },
                      icon: Icon(Icons.calendar_today))
                ],
              ),

              SizedBox(
                height: 20,
              ),
              button(() {
                if (
                    orgNameController.text.isEmpty ||
                    guardianNameController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    contNoController.text.isEmpty ||
                    permanentAddController.text.isEmpty ||
                    businessController.text.isEmpty ||
                    adharController.text.isEmpty ||
                    placeController.text.isEmpty ||
                    eduCtrl.text.isEmpty ||
                    belongCtrl.text.isEmpty) {
                  Get.snackbar(
                    "All fields are mendatory",
                    "Please fillup all the fields",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else {
                  franForm();
                }
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

  /// --------- y/m/d -- intl
  calender() async {
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    print(picker.toString());
    String date = picker.toString();
    var txdate = DateTime.now();
    DateFormat.d().format(txdate);
    print('intl $txdate');
  }

  void franForm() async {
    var result = await networkcallService.getfranchiseAPICall(
        add: permanentAddController.text,
        adhar: adharController.text,
        age: ageController.text,
        applicantName: applicantNameController.text,
        belong: belongCtrl.text,
        business: businessController.text,
        date: '1/1/21',
        dob: '1/2/15',
        education: eduCtrl.text,
       orgName: orgNameController.text,
        parentName: guardianNameController.text,
        phNo: contNoController.text,
        place: placeController.text,
       
        sheduleDate: '1/1/21');
    if (result!) {
      orgNameController.clear();
      applicantNameController.clear();
      guardianNameController.clear();
      ageController.clear();
      contNoController.clear();
      permanentAddController.clear();
      businessController.clear();
      adharController.clear();
      placeController.clear();
    }
  }

  void _selectImage() async {
    final _picker = ImagePicker();
    var img = await _picker.getImage(source: ImageSource.camera);
    if (img != null) {
      imgPath = img.path;
      String base64img = base64.encode(File(imgPath!).readAsBytesSync());
      setState(() {});
    }
  }
}
