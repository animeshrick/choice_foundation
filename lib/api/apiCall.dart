import 'dart:convert';
import 'dart:io';

import 'package:info_edu_app_121698/model/ContactUsModel.dart';
import 'package:info_edu_app_121698/model/aboutUsModel.dart';
import 'package:info_edu_app_121698/model/allCoursesModel.dart';
import 'package:info_edu_app_121698/model/banner.dart';
import 'package:info_edu_app_121698/model/bridalBannerModel.dart';
import 'package:info_edu_app_121698/model/bridalFormModel.dart';
import 'package:info_edu_app_121698/model/buttonImages.dart';
import 'package:info_edu_app_121698/model/centersModel.dart';
import 'package:info_edu_app_121698/model/coursesModel.dart';
import 'package:info_edu_app_121698/model/donationModel.dart';
import 'package:info_edu_app_121698/model/franchiseModel.dart';
import 'package:info_edu_app_121698/model/gallery.dart';
import 'package:info_edu_app_121698/model/makeUpOptions.dart';
import 'package:info_edu_app_121698/model/membersModel.dart';
import 'package:info_edu_app_121698/model/regDetails.dart';
import 'package:info_edu_app_121698/model/resultModel.dart';
import 'package:info_edu_app_121698/model/serviceDetailsModel.dart';
import 'package:info_edu_app_121698/model/studentFormModel.dart';
import 'package:info_edu_app_121698/model/technicalSearch.dart';
import 'package:info_edu_app_121698/model/termsAndConditions.dart';
import 'package:info_edu_app_121698/utils/const.dart';
import 'package:info_edu_app_121698/model/bankDetailsModel.dart';
import 'package:intl/intl.dart';
import 'MyClient.dart';
import 'package:http/http.dart' as http;

class Networkcall {
  static final Networkcall networkcall = new Networkcall._internal();

  Networkcall._internal();

  factory Networkcall() {
    return networkcall;
  }

  /// --------------------------- API CALLS -------------------------

/* ------------------------------------------------------------- */

/* ------------------ search no-technical ---------------- */
  Future<List<SearchData>?> getNonTechSearchApiCall({
    required String searchItem,
  }) async {
    Map<String, dynamic> data = {
      'center_search': searchItem,
    };
    final response =
        await MyClient().post(Uri.parse(searchNonTechnical), body: data);
    var resp = response.body;
    print('$searchNonTechnical --> $resp  $data');
    try {
      if (response.statusCode == 200) {
        final myResponse = CenterSearch.fromJson(jsonDecode(resp));
        if (myResponse.responseCode == success) {
          // showToast(myResponse.msg, green);
          return myResponse.technicalCenterData;
        } else {
          showToast(myResponse.msg, red);
          return [];
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------ search technical ---------------- */
  Future<List<SearchData>?> getTechSearchApiCall({
    required String searchItem,
  }) async {
    Map<String, dynamic> data = {
      'center_search': searchItem,
    };
    final response =
        await MyClient().post(Uri.parse(searchTechnical), body: data);
    var resp = response.body;
    print('$searchTechnical --> $resp  $data');
    try {
      if (response.statusCode == 200) {
        final myResponse = CenterSearch.fromJson(jsonDecode(resp));
        if (myResponse.responseCode == success) {
          // showToast(myResponse.msg, green);
          return myResponse.technicalCenterData;
        } else {
          showToast(myResponse.msg, red);
          return [];
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------- bank details ------------ */
  Future<BankDetailsModel?> getBankDetails() async {
    final response = await MyClient().get(
      Uri.parse(bankDetails),
    );
    var resp = response.body;
    // print('$bankDetails --> $resp');
    try {
      if (response.statusCode == 200) {
        final myResponse = BankDetailsModel.fromJson(jsonDecode(resp));
        if (myResponse.responseCode == success) {
          // showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ---------------- donation payment details ------------------- */
  Future<StudentFormModel?> getDonationPaymentDetails({
    required String donationId,
    required String paymentId,
    required String status,
  }) async {
    Map<String, dynamic> data = {
      'donation_id': donationId,
      'payment_id': paymentId,
      'status': status,
    };
    final response =
        await MyClient().post(Uri.parse(donationPayment), body: data);
    var resp = response.body;
    // print('$donationPayment --> $resp  $data');
    try {
      if (response.statusCode == 200) {
        final myResponse = StudentFormModel.fromJson(jsonDecode(resp));
        if (myResponse.responseCode == success) {
          showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* --------------- reg details ---------------------*/
  Future<List<RegisterData>?> getRegDetailsAPICall() async {
    final response = await MyClient().get(Uri.parse(regDet));
    var resp = response.body;
    final myResponse = CompRegisterModel.fromJson(jsonDecode(resp));
    // print('$regDet --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.registerData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------------ members ---------------------- */
  Future<List<MemberData>?> getMembers() async {
    final response = await MyClient().get(Uri.parse(members));
    var resp = response.body;
    final myResponse = MembersModel.fromJson(jsonDecode(resp));
    // print('$members --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.memberData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------------ t & c ---------------------- */
  Future<TcModel?> getTC() async {
    final response = await MyClient().get(Uri.parse(tc));
    var resp = response.body;
    final myResponse = TcModel.fromJson(jsonDecode(resp));
    // print('$tc --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- bridal form -------------- */
  Future<BridalFormModel?> getBridalForm({
    required String makeupId,
    required String firstName,
    required String lastName,
    required String email,
    required String address,
    required String phone,
    required File image,
  }) async {
    Map<String, dynamic> data = {
      'makeup_id': makeupId,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'address': address,
      'phone': phone,
      'image': image
    };

    var request = http.MultipartRequest('POST', Uri.parse(bridal));
    request.fields['makeup_id'] = makeupId;
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['email'] = email;
    request.fields['address'] = address;
    request.fields['phone'] = phone;

    request.files.add(http.MultipartFile(
        'image', image.readAsBytes().asStream(), image.lengthSync(),
        filename: image.path.split('/').last));

    var response = await request.send();
    //print(await response.stream.bytesToString());
    var resBody = await response.stream.bytesToString();
    // final response = await MyClient().post(Uri.parse(bridal), body: data);
    // var resp = response.body;
    // print('$bridal --> $resp  $data');
    try {
      if (response.statusCode == 200) {
        final myResponse = BridalFormModel.fromJson(jsonDecode(resBody));
        if (myResponse.responseCode == success) {
          showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.stream.bytesToString();
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- bridal banner --------------------- */
  Future<List<BeauticianBannerData>?> getBridalBanner() async {
    final response = await MyClient().get(Uri.parse(bridalBanner));
    var resp = response.body;
    final myResponse = BridalBanner.fromJson(jsonDecode(resp));
    // print('$bridalBanner --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.beauticianBannerData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- get makeup kit --------------------- */
  Future<List<MakeupData>?> getMakeupkitOptions() async {
    final response = await MyClient().get(Uri.parse(makeUp));
    var resp = response.body;
    final myResponse = MakeupOptionsModel.fromJson(jsonDecode(resp));
    // print('$makeUp --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.makeupData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------------- get center ------------------- */
  Future<CenterModel?> getCenters() async {
    final response = await MyClient().get(Uri.parse(center));
    var resp = response.body;
    final myResponse = CenterModel.fromJson(jsonDecode(resp));
    // print('$center --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ---------------------- get all courses -----------------------*/
  Future<List<AllcourseData>?> getAllCoursesAPICall() async {
    final response = await MyClient().get(Uri.parse(allCourses));
    var resp = response.body;
    final myResponse = AllCoursesModel.fromJson(jsonDecode(resp));
    // print('$allCourses --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.allcourseData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- student form -------------- */
  Future<StudentFormModel?> getStudentForm({
    required String courseID,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String dob,
    required String gender,
    required String qualification,
    required String address,
    required File image,
  }) async {
    Map<String, dynamic> data = {
      'course_id': courseID,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phone,
      'email': email,
      'date_of_birth': dob,
      'gender': gender,
      'qualification': qualification,
      'address': address,
    };

    var request = http.MultipartRequest('POST', Uri.parse(studentForm));
    request.fields['course_id'] = courseID;
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['phone_number'] = phone;
    request.fields['email'] = email;
    request.fields['date_of_birth'] = dob;
    request.fields['gender'] = gender;
    request.fields['qualification'] = qualification;
    request.fields['address'] = address;

    request.files.add(http.MultipartFile(
        'image', image.readAsBytes().asStream(), image.lengthSync(),
        filename: image.path.split('/').last));

    var response = await request.send();
    // print(await response.stream.bytesToString());
    var respBody = await response.stream.bytesToString();
    // final response = await MyClient().post(Uri.parse(studentForm), body: data);
    // var resp = response.body;
    // print('$studentForm --> $resp  $data');
    try {
      if (response.statusCode == 200) {
        final myResponse = StudentFormModel.fromJson(jsonDecode(respBody));
        if (myResponse.responseCode == success) {
          showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.stream.bytesToString();
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- APPLY FRANCHISE --------------------- */
  Future<FranchiseModel?> getfranchiseAPICall(
      {required String orgName,
      required String sheduleDate,
      required String applicantName,
      required String parentName,
      required String age,
      required String dob,
      required String phNo,
      required String belong,
      required String education,
      required String add,
      required String business,
      required String adhar,
      required String place,
      required File img,
      required String date}) async {
    Map<String, String> data = {
      'name_of_the_org': orgName,
      'scheduled_date':
         formatDate(sheduleDate.split(' ')[0]),
      'name_of_applicant': applicantName,
      'name_of_guardian': parentName,
      'age': age,
      'date_of_birth': formatDate(dob.split(' ')[0]),
      'contact_no': phNo,
      'belong': belong,
      'educational_qualification': education,
      'permanent_address': add,
      'nature_of_business': business,
      'aadhaar_no': adhar,
      'place': place,
      'date': formatDate(date.split(' ')[0]),
    };
    print(data);
    var request = http.MultipartRequest('POST', Uri.parse(applyfranchise));
    request.fields.addAll(data);

    // request.fields['name_of_the_org'] = orgName;
    // request.fields['scheduled_date'] = sheduleDate;
    // request.fields['name_of_applicant'] = applicantName;
    // request.fields['name_of_guardian'] = parentName;
    // request.fields['age'] = age;
    // request.fields['date_of_birth'] = dob;
    // request.fields['contact_no'] = phNo;
    // request.fields['belong'] = belong;
    // request.fields['educational_qualification[]'] = education;
    // request.fields['permanent_address'] = add;
    // request.fields['nature_of_business'] = business;
    // request.fields['aadhaar_no'] = adhar;
    // request.fields['place'] = place;
    // request.fields['date'] = date;

    request.files.add(http.MultipartFile(
        'receipt_image', img.readAsBytes().asStream(), img.lengthSync(),
        filename: img.path.split('/').last));

    var response = await request.send();
    // var respBody = await response.stream.bytesToString();
    // print(await response.stream.bytesToString());
    // print('$respBody');
    try {
      if (response.statusCode == 200) {
        print('done');
        final myResponse = FranchiseModel.fromJson(
            jsonDecode(await response.stream.bytesToString()));
        if (myResponse.responseCode == success) {
          showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw await response.stream.bytesToString();
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------------- service details ----------------- */
  Future<List<ServiceData>?> getServiceAPICall() async {
    final response = await MyClient().get(Uri.parse(serviceDetails));
    var resp = response.body;
    final myResponse = ServiceDetailsModel.fromJson(jsonDecode(resp));
    // print('$aboutUs --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.serviceData;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- donation --------------------- */
  Future<DonationModel?> getDontaionAPICall({
    required String firstName,
    required String lastName,
    required String occupation,
    required String address,
    // required String amount,
    required String purpose,
    required File image,
    required String email,
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      'first_name': firstName,
      'last_name': lastName,
      'occupation': occupation,
      'address': address,
      // 'amount': amount,
      'purpose': purpose,
      'image': image,
      'email': email,
      'phone': phone,
    };

    var request = http.MultipartRequest('POST', Uri.parse(dontaion));
    request.fields['first_name'] = firstName;
    request.fields['last_name'] = lastName;
    request.fields['occupation'] = occupation;
    request.fields['address'] = address;
    // 'amount': amount,
    request.fields['purpose'] = purpose;
    request.fields['email'] = email;
    request.fields['phone'] = phone;

    request.files.add(http.MultipartFile(
        'image', image.readAsBytes().asStream(), image.lengthSync(),
        filename: image.path.split('/').last));

    var response = await request.send();
    // print(await response.stream.bytesToString());
    var respBody = await response.stream.bytesToString();
    // final response = await MyClient().post(Uri.parse(dontaion), body: data);
    // var resp = response.body;
    // print('x $dontaion --> $data $resp');
    try {
      if (response.statusCode == 200) {
        final myResponse = DonationModel.fromJson(jsonDecode(respBody));
        if (myResponse.responseCode == success) {
          showToast(myResponse.msg, green);
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.stream.bytesToString();
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ------------------- result --------------------- */
  Future<ResultModel?> getResultAPICall(String regNo) async {
    Map<String, dynamic> data = {'registration_number': regNo};
    final response = await MyClient().post(Uri.parse(result), body: data);
    var resp = response.body;
    // print('$result --> $resp');

    try {
      if (response.statusCode == 200) {
        final myResponse = ResultModel.fromJson(jsonDecode(resp));
        if (myResponse.responseCode == success) {
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* -------------------- courses ------------------------------- */

  Future<CourseModel?> getCoursesAPICall() async {
    final response = await MyClient().get(Uri.parse(course));
    var resp = response.body;
    // print('$course --> $resp');
    final myResponse = CourseModel.fromJson(jsonDecode(resp));
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* -------------------- contact us form ------------------------------- */
  Future<bool> getContactForms(String firstName, String lastName, String email,
      String message, String phone) async {
    Map<String, dynamic> data = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'message': message
    };
    final response = await MyClient().post(Uri.parse(contact), body: data);
    var resp = response.body;
    // print('$contact --> $resp');
    final myResponse = jsonDecode(resp);
    try {
      if (response.statusCode == 200) {
        if (myResponse['response_code'] == success) {
          showToast(myResponse['msg'], btnColor);
          return true;
        } else {
          showToast(myResponse['msg'], red);
          return false;
        }
      } else {
        showToast(json.decode(response.body)['msg'], red);
        return false;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* -------------------- contact us ------------------------------- */
  Future<ConntactUsModel?> getContactUs() async {
    final response = await MyClient().get(Uri.parse(contactUs));
    var resp = response.body;
    // print('$contactUs --> $resp');
    final myResponse = ConntactUsModel.fromJson(jsonDecode(resp));
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* -------------------- about us ------------------------------- */
  Future<Data?> getAboutUs() async {
    final response = await MyClient().get(Uri.parse(aboutUs));
    var resp = response.body;
    final myResponse = AboutUsModel.fromJson(jsonDecode(resp));
    // print('$aboutUs --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.data;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ----------------- banner -------------------- */
  Future<List<BannerImageData>?> getBannerAPICall() async {
    final response = await MyClient().get(Uri.parse(banner));
    var resp = response.body;
    final myResponse = BannerImage.fromJson(jsonDecode(resp));
    // print('$aboutUs --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.data;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ----------------- gallery -------------------- */
  Future<List<GalleryData>?> getGalleryAPICall() async {
    final response = await MyClient().get(Uri.parse(gallery));
    var resp = response.body;
    // print('$gallery --> $resp');
    final myResponse = GalleryModel.fromJson(jsonDecode(resp));

    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.gallerydata;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }

/* ----------------- button images -------------------- */
  Future<List<ButtomImageData>?> getButtonImagesAPICall() async {
    final response = await MyClient().get(Uri.parse(btnImages));
    var resp = response.body;
    final myResponse = ButtomImages.fromJson(jsonDecode(resp));
    // print('$btnImages --> $resp');
    try {
      if (response.statusCode == 200) {
        if (myResponse.responseCode == success) {
          return myResponse.btnImagesdata;
        } else {
          showToast(myResponse.msg, red);
          return null;
        }
      } else {
        throw response.body;
      }
    } on SocketException {
      showToast(internetError, red);
      throw internetError;
    }
  }
}

class Final {}

Networkcall networkcallService = new Networkcall();
