class ServiceDetailsModel {
  ServiceDetailsModel({
    required this.serviceData,
    required this.msg,
    required this.responseCode,
  });

  final List<ServiceData> serviceData;
  final String msg;
  final int responseCode;

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) =>
      ServiceDetailsModel(
        serviceData: List<ServiceData>.from(
            json["serviceData"].map((x) => ServiceData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
      );
}

class ServiceData {
  ServiceData({
     this.id,
     this.title,
  });

  final int? id;
  final String? title;

  factory ServiceData.fromJson(Map<String, dynamic> json) => ServiceData(
        id: json["id"],
        title: json["title"],
      );
}
