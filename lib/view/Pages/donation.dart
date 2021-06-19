import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
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
  TextEditingController amountCtrl = TextEditingController();
  TextEditingController purposeCtrl = TextEditingController();

  final ScrollController controller = ScrollController();

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
  //     dontaionForm();
  //   });
  // }

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
              textField(occuCtrl, 'Occupation : '),
              textField(addCtrl, 'Address : '),
              textField(purposeCtrl, 'Your purpose of donation : '),
              textField(amountCtrl, 'Amount : ',
                  keyboardType: TextInputType.number),
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
                } else if (occuCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Occupation is empty",
                    "Please enter your Occupation",
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
                } else if (amountCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Amount is empty",
                    "Please enter an amount",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else if (purposeCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Purpose is empty",
                    "Please enter a purpose",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else {
                  dontaionForm();
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

  void dontaionForm() async {
    showProgress(context);
    var _result = await networkcallService.getDontaionAPICall(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        occupation: occuCtrl.text,
        address: addCtrl.text,
        amount: amountCtrl.text,
        purpose:   purposeCtrl.text);
    hideProgress(context);
    if (_result!) {
      firstNameController.clear();
      lastNameController.clear();
      occuCtrl.clear();
      addCtrl.clear();
      amountCtrl.clear();
      purposeCtrl.clear();
      // Get.snackbar('title', 'message');
    }
  }
}
