import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            leadingWidth: 40,
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
              customText('Occupation', black, 18),
              SizedBox(
                height: 0.1.sh,
                child: Card(
                  color: Color(0xffE8E8E8),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 15),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: 'Select your  Occupation',
                        elevation: 16,
                        icon: Icon(Icons.arrow_drop_down_circle),
                        isExpanded: true,
                        items: <String>['Select your  Occupation', 'Dept2']
                            .map((e) {
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
              textField(addCtrl, 'Address : '),
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
