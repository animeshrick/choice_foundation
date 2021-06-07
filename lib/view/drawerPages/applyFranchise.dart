import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';

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
                    child: CircleAvatar(
                      radius: 0.1.sh,
                      child: Image.network(
                          'https://www.clipartkey.com/mpngs/m/29-297748_round-profile-image-placeholder.png'),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    right: 100,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          size: 35,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
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
              textField(ageController, 'Age'),

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
              textField(contNoController, 'Contact Number'),

              /// --------------- checkbox ------------
              customText('Whether belong to:', black, 16.0),
              Checkbox(value: false, onChanged: (val) {}),
              customText('Educational Qualification :', black, 16.0),

              Checkbox(value: false, onChanged: (val) {}),
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
              button(() {}, "SUBMIT"),
              SizedBox(
                height: 0.05.sh,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  /// --------- y/m/d
  calender() async {
    var picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040));
    print(picker);
  }
}
