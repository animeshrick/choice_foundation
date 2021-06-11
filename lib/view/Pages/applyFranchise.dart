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
  TextEditingController regNoController = TextEditingController();
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
              Stack(
                children: [
                  Center(
                    child: imgPath != null
                        ? Image.file(File(imgPath!))
                        : CachedNetworkImage(
                            imageUrl:
                                'https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg',
                            errorWidget: (context, url, error) => Text("error"),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              radius: 60,
                              backgroundImage: imageProvider,
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                          ),
                  ),
                  Positioned(
                    top: 80,
                    right: 110,
                    child: IconButton(
                        onPressed: () {
                          _selectImage();
                        },
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 35,
                          color: grey,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              customText('CHOICE FOUNDATION', black, 20.0,
                  fontWeight: FontWeight.bold),
              customText(freText, black, 18),
              SizedBox(
                height: 20,
              ),

              /// ---------------- form data ------------------
              textField(regNoController, 'Registation Number'),
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
                if (regNoController.text.isEmpty ||
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
      'data:image/png;base64,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',
      //img
      regNoController.text,
      orgNameController.text,
      '1/1/2021', //shedule date
      applicantNameController.text,
      guardianNameController.text,
      ageController.text,
      '1/1/1998', //dob
      contNoController.text,
      belongCtrl.text,
      eduCtrl.text,
      permanentAddController.text,
      businessController.text,
      adharController.text,
      placeController.text,
      '1/1/21', //date
    );
    if (result!) {
      regNoController.clear();
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
