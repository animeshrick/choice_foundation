import 'dart:convert';
import 'dart:io';

import 'package:info_edu_app_121698/model/ContactUsModel.dart';
import 'package:info_edu_app_121698/model/aboutUsModel.dart';
import 'package:info_edu_app_121698/model/allCoursesModel.dart';
import 'package:info_edu_app_121698/model/banner.dart';
import 'package:info_edu_app_121698/model/buttonImages.dart';
import 'package:info_edu_app_121698/model/centersModel.dart';
import 'package:info_edu_app_121698/model/coursesModel.dart';
import 'package:info_edu_app_121698/model/gallery.dart';
import 'package:info_edu_app_121698/model/resultModel.dart';
import 'package:info_edu_app_121698/model/serviceDetailsModel.dart';
import 'package:info_edu_app_121698/utils/const.dart';

import 'MyClient.dart';

class Networkcall {
  static final Networkcall networkcall = new Networkcall._internal();

  Networkcall._internal();

  factory Networkcall() {
    return networkcall;
  }

  /// --------------------------- API CALLS -------------------------

/* ------------------------------------------------------------- */

/* ------------------- get makeup kit --------------------- */
  Future<CenterModel?> getMakeupkitOptions() async {
    final response = await MyClient().get(Uri.parse(makeUp));
    var resp = response.body;
    final myResponse = CenterModel.fromJson(jsonDecode(resp));
    print('$makeUp --> $resp');
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

/* ------------------------- get center ------------------- */
  Future<CenterModel?> getCenters() async {
    final response = await MyClient().get(Uri.parse(center));
    var resp = response.body;
    final myResponse = CenterModel.fromJson(jsonDecode(resp));
    print('$center --> $resp');
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
    print('$allCourses --> $resp');
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
  Future<bool> getStudentForm(
      {required String courseID,
      required String firstName,
      required String lastName,
      required String email,
      required String phone,
      required String dob,
      required String gender,
      required String qualification,
      required String address}) async {
    Map<String, dynamic> data = {
      'course_id': courseID,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'date_of_birth': dob,
      'gender': gender,
      'qualification': qualification,
      'address': address,
    };
    final response = await MyClient().post(Uri.parse(studentForm), body: data);
    var resp = response.body;
    print('$studentForm --> $resp  $data');
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

/* ------------------- APPLY FRANCHISE --------------------- */
  Future<bool?> getfranchiseAPICall(
      String img,
      String regNo,
      String orgName,
      String sheduleDate,
      String applicantName,
      String parentName,
      String age,
      String dob,
      String phNo,
      String belong,
      String education,
      String add,
      String business,
      String adhar,
      String place,
      String date) async {
    Map<String, dynamic> data = {
      'reg_no': regNo,
      'name_of_the_org': orgName,
      'scheduled_date': sheduleDate,
      'name_of_applicant': applicantName,
      'name_of_guardian': parentName,
      'age': age,
      'date_of_birth': dob,
      'contact_no': phNo,
      'belong': belong,
      'educational_qualification[]': education,
      'permanent_address': add,
      'nature_of_business': business,
      'aadhaar_no': adhar,
      'place': place,
      'date': date,
      'image_name': img
    };
    final response =
        await MyClient().post(Uri.parse(applyfranchise), body: data);
    var resp = response.body;
    print('$applyfranchise --> $data $resp');
    final myResponse = jsonDecode(dontaion);
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
  Future<bool?> getDontaionAPICall(String firstName, String lastName,
      String occupation, String address, String amount) async {
    Map<String, dynamic> data = {
      ' first_Name': firstName,
      'last_name': lastName,
      'occupation': occupation,
      'address': address,
      'amount': amount
    };
    final response = await MyClient().post(Uri.parse(dontaion), body: data);
    var resp = response.body;
    print('$dontaion --> $data $resp');
    final myResponse = jsonDecode(dontaion);
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

/* ------------------- result --------------------- */
  Future<ResultModel?> getResultAPICall(String regNo) async {
    Map<String, dynamic> data = {'registration_number': regNo};
    final response = await MyClient().post(Uri.parse(result), body: data);
    var resp = response.body;
    print('$result --> $resp');

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
