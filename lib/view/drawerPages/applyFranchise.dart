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
            leadingWidth: 40,
            leading: CircleAvatar(
                backgroundColor: white,
                radius: 15,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: red,
                    ))),
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
              textField(firstNameController, 'First Name : '),
              textField(lastNameController, 'Last Name : '),
              textField(emailController, 'Email Address : '),
              textField(firstNameController, 'Phone Number : '),
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
}
