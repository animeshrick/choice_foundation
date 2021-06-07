class ConntactUsModel {
  ConntactUsModel({
    required this.data,
    required this.msg,
    required this.responseCode,
  });

  final ConntactUsData? data;
  final String? msg;
  final int? responseCode;

  factory ConntactUsModel.fromJson(Map<String, dynamic> json) =>
      ConntactUsModel(
        data: ConntactUsData.fromJson(json["contactData"]),
        msg: json["msg"],
        responseCode: json["response_code"],
      );
}

class ConntactUsData {
  ConntactUsData({
    required this.officeAddress,
    required this.branchOffice,
    required this.email,
    required this.phone,
    required this.facebook,
    required this.twitter,
    required this.googlePlus,
    required this.instagram,
    required this.latitude,
    required this.longitude,
  });

  final String? officeAddress;
  final String? branchOffice;
  final String? email;
  final String? phone;
  final String? facebook;
  final String? twitter;
  final String? googlePlus;
  final String? instagram;
  final double? latitude;
  final double? longitude;

  factory ConntactUsData.fromJson(Map<String, dynamic> json) => ConntactUsData(
        officeAddress: json["office-address"],
        branchOffice: json["branch-office"],
        email: json["email"],
        phone: json["phone"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        googlePlus: json["google-plus"],
        instagram: json["instagram"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );
}
