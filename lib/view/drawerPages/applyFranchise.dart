import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            leading: CircleAvatar(
                backgroundColor: white,
                radius: 15,
                child: IconButton(
                    onPressed: () {},
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
        controller: controller,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

              ///-----------------------------------
              customText('Office Address', black, 20,
                  fontWeight: FontWeight.bold),
              customText('PRAMOD NAGAR AMRAI DURGAPUR-03', black, 16),
              SizedBox(
                height: 20,
              ),

              ///-----------------------------------
              customText('Branch Office', black, 20,
                  fontWeight: FontWeight.bold),
              customText(
                  'Philips Lane, Pasupati Market, Near Bank Of Baroda, Benachity, Durgapur-13',
                  black,
                  16),
              SizedBox(
                height: 20,
              ),

              ///-----------------------------------
              customText('Email', black, 20, fontWeight: FontWeight.bold),
              customText(
                  'choicefoundationdgp@gmail.com / krisnendu89@gmail .com',
                  black,
                  16),
              SizedBox(
                height: 20,
              ),

              ///-----------------------------------
              customText('Phone', black, 20, fontWeight: FontWeight.bold),
              customText('6295584343 / 8972263758 / 7363978811', black, 16),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
