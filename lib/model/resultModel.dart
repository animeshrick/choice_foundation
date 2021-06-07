class ResultModel {
  ResultModel({
    required this.data,
    required this.msg,
    required this.responseCode,
  });

  final ResultData? data;
  final String msg;
  final int responseCode;

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        data: json["data"] == null ? null : ResultData.fromJson(json["data"]),
        msg: json["msg"],
        responseCode: json["response_code"],
      );
}

class ResultData {
  ResultData({
    this.id,
    this.studentName,
    this.registrationNumber,
    this.nameOfCenter,
    this.result,
    this.status,
  });

  final int? id;
  final String? studentName;
  final String? registrationNumber;
  final String? nameOfCenter;
  final String? result;
  final String? status;

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        id: json["id"],
        studentName: json["student_name"],
        registrationNumber: json["registration_number"],
        nameOfCenter: json["name_of_center"],
        result: json["result"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "student_name": studentName,
        "registration_number": registrationNumber,
        "name_of_center": nameOfCenter,
        "result": result,
        "status": status,
      };
}
