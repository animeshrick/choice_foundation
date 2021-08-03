import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/bankDetailsModel.dart';
import 'package:info_edu_app_121698/model/bridalBannerModel.dart';
import 'package:info_edu_app_121698/model/makeUpOptions.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bridal extends StatefulWidget {
  @override
  _BridalState createState() => _BridalState();
}

class _BridalState extends State<Bridal> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController addCtrl = TextEditingController();

  //final ScrollController controller = ScrollController();

  String? imgPath;
  File? _image;
  final picker = ImagePicker();
  String? kitValue, kitId;

  List<MakeupData> kitList = [];
  var bannerList = <BeauticianBannerData>[].obs;
  var _bankDetails =
      BankDetailsModel(data: BankData(), msg: '', responseCode: 1).obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _bridalBanner();
      _mkaeupKit();
      bankDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            // controller: controller,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                    title: Text('Bridal'),
                    background: Image.asset(
                      appBar,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ];
            },
            body: Obx(
              () => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: 0.3.sh,
                        width: 1.sw,
                        child: bannerList.length == 0
                            ? Text('No Data')
                            : Swiper(
                                autoplay: true,
                                itemBuilder: (BuildContext context, int index) {
                                  return CachedNetworkImage(
                                    width: 1.sw,
                                    imageUrl: '${bannerList[index].image}',
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        Text("Image have problem"),
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                  );
                                },
                                itemCount: bannerList.length,
                                pagination: new SwiperPagination(),
                                control: SwiperControl(),
                              )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 30, 30, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(bridalText, black, 18),
                          Divider(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText('For Payment Details click here :',
                                  black, 18),
                              IconButton(
                                  onPressed: () {
                                    _paymentDetails();
                                  },
                                  icon: Icon(Icons.info_outline)),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          customText('Select a Service', btnColor, 18),
                          SizedBox(
                            height: 0.1.sh,
                            child: Card(
                              color: Colors.grey[300],
                              child: DropdownButtonHideUnderline(
                                child: DropdownButtonFormField<String>(
                                  validator: (value) => value == null
                                      ? 'Please Select a Service'
                                      : null,
                                  hint: Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Text('Select a Service -'),
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
                                  value: kitValue,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      kitValue = newValue!;
                                    });
                                    kitId = kitList
                                        .where((element) =>
                                            element.name == kitValue)
                                        .toList()[0]
                                        .id
                                        .toString();
                                    print('kitId $kitId');
                                  },
                                  items: kitList.map((value) {
                                    return DropdownMenuItem<String>(
                                      value: value.name,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 0, 0, 0),
                                        child: Text(
                                          '${value.name}',
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          textField(firstNameController, 'First Name : '),
                          textField(lastNameController, 'Last Name : '),
                          textField(emailController, 'Email Address : ',
                              keyboardType: TextInputType.emailAddress),
                          textField(phoneController, 'Phone Number : ',
                              keyboardType: TextInputType.phone),
                          textField(
                            addCtrl,
                            'Enter your Detailed Address : ',
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
                            if (firstNameController.text.isEmpty ||
                                lastNameController.text.isEmpty ||
                                emailController.text.isEmpty ||
                                phoneController.text.isEmpty ||
                                addCtrl.text.isEmpty) {
                              Get.snackbar(
                                "Please check the form",
                                "All fields are mendatory to fill",
                                colorText: red,
                                icon: Icon(Icons.close),
                                shouldIconPulse: true,
                                onTap: (val) {},
                                barBlur: 20,
                                isDismissible: true,
                                duration: Duration(seconds: 3),
                              );
                            } else {
                              _bridalForm();
                            }
                          }, "SUBMIT"),
                          SizedBox(
                            height: 0.05.sh,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  Future getImagefromCam() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        // print('path --${pickedImage.path}');
        _image = File(pickedImage.path);
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
        // print('path --${pickedImage.path}');
        _image = File(pickedImage.path);
        Get.back();
      } else {
        showToast('Image not picked', red);
      }
    });
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

  // void _selectImage() async {
  //   final _picker = ImagePicker();
  //   var img = await _picker.getImage(source: ImageSource.camera);
  //   if (img != null) {
  //     imgPath = img.path;
  //     String base64img = base64.encode(File(imgPath!).readAsBytesSync());
  //     setState(() {});
  //   }
  // }

  void _mkaeupKit() async {
    showProgress(context);
    kitList = (await networkcallService.getMakeupkitOptions())!;
    hideProgress(context);
    setState(() {});
  }

  void _bridalBanner() async {
    showProgress(context);

    bannerList.value = (await networkcallService.getBridalBanner())!;
    hideProgress(context);
    // print(bannerList.length);
  }

  void _bridalForm() async {
    showProgress(context);
    var result = await networkcallService.getBridalForm(
        address: addCtrl.text,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        makeupId: kitId.toString(),
        phone: phoneController.text,
        image: _image!);
    hideProgress(context);
    if (result != null) {
      firstNameController.clear();
      lastNameController.clear();
      phoneController.clear();
      emailController.clear();
      addCtrl.clear();
      kitValue = null;
      _image = null;
      setState(() {});
    }
  }
}
