import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_edu_app_121698/api/apiCall.dart';
import 'package:info_edu_app_121698/model/bankDetailsModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/utils/widgets/button.dart';
import 'package:info_edu_app_121698/utils/widgets/textField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController occuCtrl = TextEditingController();

  TextEditingController addCtrl = TextEditingController();
  // TextEditingController amountCtrl = TextEditingController();
  TextEditingController purposeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phnCtrl = TextEditingController();
  final ScrollController controller = ScrollController();
  late Razorpay _razorpay;
  String? imgPath, fileName;
  File? _image;
  final picker = ImagePicker();
  late PaymentSuccessResponse payResponse;
  var _bankDetails =
      BankDetailsModel(data: BankData(), msg: '', responseCode: 1).obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      bankDetails();
    });

    _razorpay = Razorpay();
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customText('For Payment Details click here :', black, 18),
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
              textField(firstNameController, 'First Name : '),
              textField(lastNameController, 'Last Name : '),
              textField(occuCtrl, 'Occupation : '),
              textField(addCtrl, 'Address : '),
              textField(purposeCtrl, 'Your purpose of donation : '),
              textField(emailCtrl, 'Your Email : ',
                  keyboardType: TextInputType.emailAddress),
              textField(phnCtrl, 'Your Phone Number : ',
                  keyboardType: TextInputType.phone),
              // textField(amountCtrl, 'Amount : ',
              //     keyboardType: TextInputType.number),
              customText('Upload Payment Recipt :', black, 18,
                  fontWeight: FontWeight.w400),
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
                height: 15,
              ),
              paybutton(() {
                _pickImage();
              }, 'Upload Image'),
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
                }
                // else if (amountCtrl.text.isEmpty) {
                //   Get.snackbar(
                //     "Amount is empty",
                //     "Please enter an amount",
                //     colorText: red,
                //     icon: Icon(Icons.close),
                //     shouldIconPulse: true,
                //     onTap: (val) {},
                //     barBlur: 20,
                //     isDismissible: true,
                //     duration: Duration(seconds: 3),
                //   );
                // }
                else if (purposeCtrl.text.isEmpty) {
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
                } else if (emailCtrl.text.isEmpty) {
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
                } else if (phnCtrl.text.isEmpty) {
                  Get.snackbar(
                    "Phone is empty",
                    "Please enter Your Phone Number",
                    colorText: red,
                    icon: Icon(Icons.close),
                    shouldIconPulse: true,
                    onTap: (val) {},
                    barBlur: 20,
                    isDismissible: true,
                    duration: Duration(seconds: 3),
                  );
                } else {
                  // options();
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

  // void _selectImage() async {
  //   final _picker = ImagePicker();
  //   var img = await _picker.getImage(source: ImageSource.camera);
  //   if (img != null) {
  //     imgPath = img.path;
  //     String base64img = base64.encode(File(imgPath!).readAsBytesSync());
  //     print('bas64 --$base64img');
  //     setState(() {});
  //   }
  // }

  Future getImagefromCam() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        imgPath = pickedImage.path;
        // fileName = _image!.path.split('/').last;
        // print('fileName cam $fileName');
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
        _image = File(pickedImage.path);
        // fileName = _image!.path.split('/').last;
        // print('fileName gal $fileName');
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
                    // _selectImage();
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
                      height: 10,
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
                      height: 10,
                    ),
                    customText(
                        'Bank Account No2. : ${res.bankName2}', black, 15),
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

  // void paymentDetails() async {
  //   showProgress(context);
  //   var _res = await networkcallService.getDonationPaymentDetails(
  //       donationId: '1',
  //       paymentId: payResponse.paymentId.toString(),
  //       status: payResponse.signature.toString());
  //   hideProgress(context);
  // }

  void dontaionForm() async {
    showProgress(context);
    var _result = await networkcallService.getDontaionAPICall(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        occupation: occuCtrl.text,
        address: addCtrl.text,
        // amount: amountCtrl.text,
        purpose: purposeCtrl.text,
        image: _image!,
        email: emailCtrl.text,
        phone: phnCtrl.text);
    hideProgress(context);
    // paymentDetails();
    if (_result != null) {
      firstNameController.clear();
      lastNameController.clear();
      occuCtrl.clear();
      addCtrl.clear();
      // amountCtrl.clear();
      _image = null;
      imgPath = null;
      purposeCtrl.clear();
      phnCtrl.clear();
      emailCtrl.clear();
    }
  }

  // void options() {
  //   print('phh ${phnCtrl.text.toString()}');
  //   var options = {
  //     'key': key,
  //     'amount': num.parse(amountCtrl.text) * 100,
  //     'name': firstNameController.text + ' ' + lastNameController.text,
  //     'description': 'Donation for Choice Education',
  //     'prefill': {
  //       'contact': phnCtrl.text.toString(),
  //       'email': emailCtrl.text.toString()
  //     },
  //     'external': {
  //       'wallets': ['paytm'],
  //     },
  //   };
  //   try {
  //     showProgress(context);
  //     _razorpay.open(options);
  //     hideProgress(context);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) {
  //   print(
  //     "SUCCESS: " + response.paymentId!,
  //   );
  //   dontaionForm();
  //   showToast("PAYMENT SUCCESS", green);
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print("ERRORx: " + response.code.toString() + " - " + response.message!);
  //   showToast("ERROR: ${response.code.toString()} + ${response.message!}", red);
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   print("EXTERNAL_WALLETx: " + response.walletName!);
  //   showToast("EXTERNAL_WALLET: " + response.walletName!, grey);
  // }
}
