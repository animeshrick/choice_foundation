class CenterModel {
    CenterModel({
        required this.technicalCenterData,
        required this.nontechnicalCenterData,
        required this.msg,
        required this.responseCode,
    });

    final List<CentersData> technicalCenterData;
    final List<CentersData> nontechnicalCenterData;
    final String msg;
    final int responseCode;

    factory CenterModel.fromJson(Map<String, dynamic> json) => CenterModel(
        technicalCenterData: List<CentersData>.from(json["technicalCenterData"].map((x) => CentersData.fromJson(x))),
        nontechnicalCenterData: List<CentersData>.from(json["nontechnicalCenterData"].map((x) => CentersData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class CentersData {
    CentersData({
        required this.centerName,
        required this.address,
        required this.type,
    });

    final String centerName;
    final String address;
    final String type;

    factory CentersData.fromJson(Map<String, dynamic> json) => CentersData(
        centerName: json["center_name"],
        address: json["address"],
        type: json["type"],
    );
}
