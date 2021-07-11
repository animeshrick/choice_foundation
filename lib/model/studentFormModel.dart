class StudentFormModel {
  StudentFormModel({
    required this.msg,
    required this.studentApplicationId,
    required this.responseCode,
  });

  final String msg;
  final int studentApplicationId;
  final int responseCode;

  factory StudentFormModel.fromJson(Map<String, dynamic> json) =>
      StudentFormModel(
        msg: json["msg"] ?? '',
        studentApplicationId: json["student_application_id"] ?? 0,
        responseCode: json["response_code"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "msg": msg,
        "student_application_id": studentApplicationId,
        "response_code": responseCode,
      };
}
