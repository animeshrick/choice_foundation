// To parse this JSON data, do
//
//     final compRegisterModel = compRegisterModelFromJson(jsonString);

class CompRegisterModel {
    CompRegisterModel({
        required this.registerData,
        required this.msg,
        required this.responseCode,
    });

    final List<RegisterData> registerData;
    final String msg;
    final int responseCode;

    factory CompRegisterModel.fromJson(Map<String, dynamic> json) => CompRegisterModel(
        registerData: List<RegisterData>.from(json["registerData"].map((x) => RegisterData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class RegisterData {
    RegisterData({
        required this.id,
        required this.description,
    });

    final int id;
    final String description;

    factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        id: json["id"],
        description: json["description"],
    );
}
