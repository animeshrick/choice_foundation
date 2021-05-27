import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';

class StudentForm extends StatelessWidget {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      controller: controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: CircleAvatar(
                backgroundColor: white,
                // radius: 15,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: red,
                    ))),
            automaticallyImplyLeading: false,
            primary: true,
            floating: false,
            pinned: false,
            forceElevated: false,
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
                  color: Color(0xffE8E8E8),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'School Course (I-IV)',
                        elevation: 16,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        isExpanded: true,
                        items:
                            <String>['School Course (I-IV)', 'Dept2'].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              textField(firstNameController, 'First Name : '),
              textField(lastNameController, 'Last Name : '),
              textField(emailController, 'Email Address : '),
              textField(firstNameController, 'Phone Number : '),
              SizedBox(
                height: 20,
              ),
              button(() {}, "REQUEST QUOTE"),
              SizedBox(
                height: 0.05.sh,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
