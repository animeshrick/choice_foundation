class TcModel {
    TcModel({
        required this.termsData,
        required this.msg,
        required this.responseCode,
    });

    final TermsData termsData;
    final String msg;
    final int responseCode;

    factory TcModel.fromJson(Map<String, dynamic> json) => TcModel(
        termsData: TermsData.fromJson(json["termsData"]),
        msg: json["msg"],
        responseCode: json["response_code"],
    );

    Map<String, dynamic> toJson() => {
        "termsData": termsData.toJson(),
        "msg": msg,
        "response_code": responseCode,
    };
}

class TermsData {
    TermsData({
        required this.title,
        required this.description,
    });

    final String title;
    final String description;

    factory TermsData.fromJson(Map<String, dynamic> json) => TermsData(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}
