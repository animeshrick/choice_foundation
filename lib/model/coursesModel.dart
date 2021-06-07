class CourseModel {
  CourseModel({
    required this.technicalCourseData,
    required this.nontechnicalCourseData,
    required this.msg,
    required this.responseCode,
  });

  final List<CourseData> technicalCourseData;
  final List<CourseData> nontechnicalCourseData;
  final String msg;
  final int responseCode;

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        technicalCourseData: List<CourseData>.from(
            json["technicalCourseData"].map((x) => CourseData.fromJson(x))),
        nontechnicalCourseData: List<CourseData>.from(
            json["nontechnicalCourseData"].map((x) => CourseData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
      );
}

class CourseData {
  CourseData({
    required this.courseType,
    required this.courseName,
    required this.courseDetails,
    required this.courseDuration,
    required this.courseFee,
  });

  final String courseType;
  final String courseName;
  final String courseDetails;
  final String courseDuration;
  final String courseFee;

  factory CourseData.fromJson(Map<String, dynamic> json) => CourseData(
        courseType: json["course_type"],
        courseName: json["course_name"],
        courseDetails: json["course_details"],
        courseDuration: json["course_duration"],
        courseFee: json["course_fee"],
      );
}
