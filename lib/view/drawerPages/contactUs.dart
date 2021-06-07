import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/ContactUsModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController msgController = TextEditingController();
  final ScrollController controller = ScrollController();

  Completer<GoogleMapController> _controller = Completer();
  var _data = ConntactUsModel(
          msg: '',
          responseCode: 1,
          data: ConntactUsData(
              officeAddress: '',
              branchOffice: '',
              email: '',
              phone: '',
              facebook: '',
              twitter: '',
              googlePlus: '',
              instagram: '',
              latitude: 23.5814467,
              longitude: 87.2543702))
      .obs;

  @override
  void initState() {
    super.initState();
    _contactUs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      var value = _data.value.data!;
      var fbUrl = value.facebook;
      var twitterUrl = value.twitter;
      var googlePlusUrl = value.googlePlus;
      var instaUrl = value.instagram;
      var lat = double.parse(value.latitude.toString());
      var lon = double.parse(value.longitude.toString());
      return NestedScrollView(
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
                    title: Text('Contact Us'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          ];
        },
        body: SingleChildScrollView(
          // controller: controller,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textField(firstNameController, 'First Name : '),
                textField(lastNameController, 'Last Name : '),
                textField(emailController, 'Email Address : '),
                textField(phoneController, 'Phone Number : '),
                textField(msgController, 'Message : '),
                SizedBox(
                  height: 20,
                ),
                button(() {
                  if (firstNameController.text.isEmpty) {
                    Get.snackbar(
                      'Firstname is empty',
                      'Enter your Firstname',
                      duration: Duration(seconds: 3),
                    );
                  } else if (lastNameController.text.isEmpty) {
                    Get.snackbar(
                      'Lastname is empty',
                      'Enter your Lastname',
                      duration: Duration(seconds: 3),
                    );
                  } else if (msgController.text.isEmpty) {
                    Get.snackbar(
                      'Message is empty',
                      'Enter your Message.',
                      duration: Duration(seconds: 3),
                    );
                  } else if (!GetUtils.isPhoneNumber(phoneController.text)) {
                    Get.snackbar(
                      'Phone number is empty',
                      'Enter your Phone number.',
                      duration: Duration(seconds: 3),
                    );
                  } else if (!GetUtils.isEmail(emailController.text)) {
                    Get.snackbar(
                      'Email is empty',
                      'Enter your Email.',
                      duration: Duration(seconds: 3),
                    );
                  } else {
                    _contactForm();
                  }
                }, "SUBMIT"),
                SizedBox(
                  height: 0.05.sh,
                ),

                ///-----------------------------------
                customText('Office Address', black, 20,
                    fontWeight: FontWeight.bold),
                customText('${value.officeAddress}', black, 16),
                SizedBox(
                  height: 20,
                ),

                ///-----------------------------------
                customText('Branch Office', black, 20,
                    fontWeight: FontWeight.bold),
                customText('${value.branchOffice}', black, 16),
                SizedBox(
                  height: 20,
                ),

                ///-----------------------------------
                customText('Email', black, 20, fontWeight: FontWeight.bold),
                customText('${value.email}', black, 16),
                SizedBox(
                  height: 20,
                ),

                ///-----------------------------------
                customText('Phone', black, 20, fontWeight: FontWeight.bold),
                customText('${value.phone}', black, 16),
                SizedBox(
                  height: 20,
                ),

                /// ---------------- map --------------
                Container(
                  height: 0.2.sh,
                  width: 1.sw,
                  child: GoogleMap(
                    mapType: MapType.hybrid,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(lat, lon),
                      zoom: 14.4746,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Divider(
                  thickness: 1,
                ),

                /// ---------------- social -----------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        launch('$fbUrl');
                      },
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/20/20673.png',
                        height: 0.07.sh,
                        width: 0.07.sw,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launch('$instaUrl');
                      },
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/1384/1384031.png',
                        height: 0.07.sh,
                        width: 0.07.sw,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launch('$twitterUrl');
                      },
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/733/733635.png',
                        height: 0.07.sh,
                        width: 0.07.sw,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launch('$googlePlusUrl');
                      },
                      child: Image.network(
                        'https://image.flaticon.com/icons/png/512/2111/2111477.png',
                        height: 0.07.sh,
                        width: 0.07.sw,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }

  void _contactUs() async {
    _data.value = (await networkcallService.getContactUs())!;
  }

  void _contactForm() async {
    showProgress(context);
    var result = await networkcallService.getContactForms(
        firstNameController.text,
        lastNameController.text,
        emailController.text,
        msgController.text,
        phoneController.text);
    hideProgress(context);
    if (result) {
      firstNameController.clear();
      lastNameController.clear();
      emailController.clear();
      msgController.clear();
      phoneController.clear();
      Get.snackbar(
        "Contact Us",
        "We recived your message. We connect with you shortly !",
        icon: Icon(Icons.done_all),
        shouldIconPulse: true,
        onTap: (val) {},
        barBlur: 20,
        isDismissible: true,
        duration: Duration(seconds: 3),
      );
    }
  }
}
