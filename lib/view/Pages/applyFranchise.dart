import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/bankDetailsModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:image_picker/image_picker.dart';

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
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();
  DateTime selectedDate3 = DateTime.now();

  Future<void> _selectDate(
      BuildContext context, StateSetter mState, String action) async {
    var date;

    if (action == '1')
      date = selectedDate;
    else if (action == '2')
      date = selectedDate2;
    else
      date = selectedDate3;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime.now().subtract(Duration(days: 20000)),
      lastDate: DateTime(2100),
    );
    if (picked != null)
      mState(() {
        if (action == '1')
          selectedDate = picked;
        else if (action == '2')
          selectedDate2 = picked;
        else
          selectedDate3 = picked;
      });
  }

  String? imgPath, fileName;
  File? _image, _img;
  final picker = ImagePicker();
  var _bankDetails =
      BankDetailsModel(data: BankData(), msg: '', responseCode: 1).obs;
  final ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bankDetails();
    });
  }

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
              customText('CHOICE FOUNDATION', black, 20.0,
                  fontWeight: FontWeight.bold),
              customText(freText, black, 18),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText('For Payment Details click here :', black, 18),
                  IconButton(
                      onPressed: () {
                        _paymentDetails();
                      },
                      icon: Icon(Icons.info_outline)),
                ],
              ),
              SizedBox(
                height: 15,
              ),

              /// ---------------- form data ------------------
              // textField(regNoController, 'Registation Number'),
              textField(orgNameController, 'Name of the Organition'),

              /// -------------- calender ------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText('Scheduled Date : ', black, 16.0),
                      Text("${selectedDate.toLocal()}".split(' ')[0]),
                    ],
                  ),
                  IconButton(
                    onPressed: () => _selectDate(context, setState, '1'),
                    icon: Icon(Icons.calendar_today),
                  ),
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
                  Row(
                    children: [
                      customText('Date of Birth : ', black, 16.0),
                      Text("${selectedDate2.toLocal()}".split(' ')[0]),
                    ],
                  ),
                  IconButton(
                    onPressed: () => _selectDate(context, setState, '2'),
                    icon: Icon(Icons.calendar_today),
                  ),
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
              textField(adharController, 'Adharcard Number',
                  keyboardType: TextInputType.number),
              textField(placeController, 'Place'),

              /// ------------ calender --------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      customText('Date :', black, 16.0),
                      Text("${selectedDate3.toLocal()}".split(' ')[0]),
                    ],
                  ),
                  IconButton(
                    onPressed: () => _selectDate(context, setState, '3'),
                    icon: Icon(Icons.calendar_today),
                  ),
                ],
              ),
              customText('Upload Payment Recipt :', black, 18,
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: 15,
              ),
              paybutton(() {
                _pickImage();
              }, 'Upload Image'),
              SizedBox(
                height: 15,
              ),
              _image == null
                  ? customText('No Image picked', red, 15)
                  : Center(
                      child: Image.file(
                        _image!,
                        scale: 2,
                        filterQuality: FilterQuality.high,
                        cacheHeight: 200,
                        cacheWidth: 200,
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              button(() {
                if (orgNameController.text.isEmpty ||
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

  Future<void> _pickImage() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Your Image'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ElevatedButton.icon(
                  label: customText('Camera', black, 15),
                  onPressed: () {
                    getImagefromCam();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: Icon(Icons.camera),
                ),
                ElevatedButton.icon(
                  label: customText('Gallery', black, 15),
                  onPressed: () {
                    getImagefromGallery();
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  icon: Icon(Icons.file_present),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future getImagefromCam() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        // fileName = _image!.path.split('/').last;
        // print('fileName gal $fileName');
        // print('path --${pickedImage.path}');
        // _img = fileName as File?;
        Get.back();
      } else {
        showToast('Image not picked', red);
      }
    });
  }

  Future getImagefromGallery() async {
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        print(_image);
        // fileName = _image!.path.split('/').last;
        // print('fileName gal $fileName');
        // print('path --${pickedImage.path}  ');
        // _img = fileName as File?;
        Get.back();
      } else {
        showToast('Image not picked', red);
      }
    });
  }

  void franForm() async {
    var result = await networkcallService.getfranchiseAPICall(
        add: permanentAddController.text,
        adhar: adharController.text,
        age: ageController.text,
        applicantName: applicantNameController.text,
        belong: belongCtrl.text,
        business: businessController.text,
        date: selectedDate3.toString(),
        dob: selectedDate2.toString(),
        education: eduCtrl.text,
        orgName: orgNameController.text,
        parentName: guardianNameController.text,
        phNo: contNoController.text,
        place: placeController.text,
        sheduleDate: selectedDate.toString(),
        img: _image!);
    if (result != null) {
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

  Future<void> _paymentDetails() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bank Account Details'),
          content: Obx(
            () {
              var res = _bankDetails.value.data;
              print('ds ${res.mobile}');
              return SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    customText('GPay/PhonePe : ${res.mobile}', black, 15),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    customText(
                        'Bank Account No1. : ${res.accountNo1}', black, 15),
                    SizedBox(
                      height: 10,
                    ),
                    customText('Bank Name : ${res.bankName1}', black, 15),
                    SizedBox(
                      height: 10,
                    ),
                    customText('IFSC Code : ${res.ifscCode1}', black, 15),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(),
                    SizedBox(
                      height: 5,
                    ),
                    customText(
                        'Bank Account No2. : ${res.accountNo2}', black, 15),
                    SizedBox(
                      height: 10,
                    ),
                    customText('Bank Name : ${res.bankName2}', black, 15),
                    SizedBox(
                      height: 10,
                    ),
                    customText('IFSC Code : ${res.ifscCode2}', black, 15),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
                onPressed: () => Get.back(), child: customText('OK', grey, 15))
          ],
        );
      },
    );
  }

  void bankDetails() async {
    showProgress(context);
    _bankDetails.value = (await networkcallService.getBankDetails())!;
    hideProgress(context);
  }
}
