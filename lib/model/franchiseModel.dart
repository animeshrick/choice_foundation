class FranchiseModel {
  FranchiseModel({
    required this.msg,
    required this.responseCode,
  });

  final String msg;
  final int responseCode;

  factory FranchiseModel.fromJson(Map<String, dynamic> json) => FranchiseModel(
        msg: json["msg"] ?? '',
        responseCode: json["response_code"] ?? 0,
      );
}
