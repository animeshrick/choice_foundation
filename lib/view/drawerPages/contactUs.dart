import 'package:flutter/material.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/drawer.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      drawer: drawer(),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        title: customText('Contact Us', black, 18),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textField(firstNameController, 'First Name'),
              textField(lastNameController, 'Last Name'),
              textField(emailController, 'Email'),
              textField(phoneController, 'Phone Number'),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 0.07.sh,
                width: 1.sw,
                child: RaisedButton(
                    color: Color(0xff88B91F),
                    onPressed: () {},
                    child: customText('SUBMIT', white, 18)),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),

              ///
              customText('Office Addres :', black, 20,
                  fontWeight: FontWeight.bold),
              customText('PRAMOD NAGAR AMRAI DURGAPUR-03', black, 16),
              SizedBox(
                height: 20,
              ),

              ///
              customText('Branch Office :', black, 20,
                  fontWeight: FontWeight.bold),
              customText(
                  'Philips Lane, Pasupati Market, Near Bank Of Baroda, Benachity, Durgapur-13',
                  black,
                  16),
              SizedBox(
                height: 20,
              ),

              ///
              customText('Email :', black, 20, fontWeight: FontWeight.bold),
              customText(
                  'choicefoundationdgp@gmail.com \n krisnendu89@gmail .com',
                  black,
                  16),
              SizedBox(
                height: 20,
              ),

              ///
              customText('Phone :', black, 20, fontWeight: FontWeight.bold),
              customText('6295584343 \n 8972263758 \n 7363978811', black, 16),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
