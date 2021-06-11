class AllCoursesModel {
    AllCoursesModel({
        required this.allcourseData,
        required this.msg,
        required this.responseCode,
    });

    final List<AllcourseData> allcourseData;
    final String msg;
    final int responseCode;

    factory AllCoursesModel.fromJson(Map<String, dynamic> json) => AllCoursesModel(
        allcourseData: List<AllcourseData>.from(json["allcourseData"].map((x) => AllcourseData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class AllcourseData {
    AllcourseData({
        required this.id,
        required this.courseType,
        required this.courseName,
        required this.courseDetails,
        required this.courseDuration,
        required this.courseFee,
    });

    final int id;
    final String? courseType;
    final String courseName;
    final String courseDetails;
    final String courseDuration;
    final String courseFee;

    factory AllcourseData.fromJson(Map<String, dynamic> json) => AllcourseData(
        id: json["id"],
        courseType: json["course_type"],
        courseName: json["course_name"],
        courseDetails: json["course_details"],
        courseDuration: json["course_duration"],
        courseFee: json["course_fee"],
    );
}
