import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/allCoursesModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController dobbCtrl = TextEditingController();

  TextEditingController genderCtrl = TextEditingController();

  TextEditingController qualiCtrl = TextEditingController();

  TextEditingController addCtrl = TextEditingController();

  String? _courseVal, _courseId;
  List<AllcourseData>? _coursesList = [];
  @override
  void initState() {
    super.initState();
    _allCourses();
  }

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
              title: Text('Student Application'),
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
              customText('Select a course', btnColor, 18),
              SizedBox(
                height: 0.1.sh,
                child: Card(
                  color: Colors.grey[300],
                  child: DropdownButtonFormField<String>(
                    validator: (value) =>
                        value == null ? 'Please select a course' : null,
                    hint: Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text('Choose a Course -'),
                    ),
                    isExpanded: true,
                    icon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                          radius: 15,
                          backgroundColor: grey,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: white,
                          )),
                    ),
                    style: const TextStyle(color: Colors.black),
                    value: _courseVal,
                    onChanged: (String? newValue) {
                      setState(() {
                        _courseVal = newValue!;
                      });
                      _courseId = _coursesList!
                          .where((element) => element.courseName == _courseVal)
                          .toList()[0]
                          .id
                          .toString();
                      print('  _courseId $_courseId');
                    },
                    items: _coursesList!.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.courseName,
                        child: Text(
                          value.courseName,
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              textField(firstNameController, 'First Name : '),
              textField(lastNameController, 'Last Name : '),
              textField(phoneController, 'Phone Number : ',
                  keyboardType: TextInputType.phone),
              textField(emailController, 'Email Address : ',
                  keyboardType: TextInputType.emailAddress),
              textField(dobbCtrl, 'DOB of applicant : ',
                  keyboardType: TextInputType.datetime, hintText: 'dd/mm/yy'),
              textField(genderCtrl, 'Gender : '),
              textField(qualiCtrl, 'Your last qualification : '),
              textField(addCtrl, 'Full address with PIN code:'),
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
                } else if (lastNameController.text.isEmpty) {
                  Get.snackbar(
                    "Lastname is empty",
                    "Please enter a your Lastname",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (emailController.text.isEmpty) {
                  Get.snackbar(
                    "Email is empty",
                    "Please enter your Email",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (phoneController.text.isEmpty) {
                  Get.snackbar(
                    "Phone number is empty",
                    "Please enter your Phone number",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (dobbCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Lastname is empty",
                    "Please enter a your Lastname",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (genderCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Gender is empty",
                    "Please enter your Gender",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (qualiCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Qualification is empty",
                    "Please enter your Qualification",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (addCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Address is empty",
                    "Please enter your Address",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else {
                  _studentForm();
                }
              }, "REQUEST QUOTE"),
              SizedBox(
                height: 0.05.sh,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _allCourses() async {
    _coursesList = await networkcallService.getAllCoursesAPICall();
    setState(() {});
  }

  void _studentForm() async {
    var result = await networkcallService.getStudentForm(
      address: addCtrl.text,
      courseID: _courseId.toString(),
      dob: dobbCtrl.text,
      email: emailController.text,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      gender: genderCtrl.text,
      phone: phoneController.text,
      qualification: qualiCtrl.text,
    );
    if (result) {
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      phoneController.clear();
      dobbCtrl.clear();
      genderCtrl.clear();
      qualiCtrl.clear();
      addCtrl.clear();
    }
  }
}
