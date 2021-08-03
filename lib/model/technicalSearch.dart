class CenterSearch {
    CenterSearch({
        required this.technicalCenterData,
        required this.msg,
        required this.responseCode,
    });

    final List<SearchData> technicalCenterData;
    final String msg;
    final int responseCode;

    factory CenterSearch.fromJson(Map<String, dynamic> json) => CenterSearch(
        technicalCenterData: List<SearchData>.from(json["technicalCenterData"].map((x) => SearchData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class SearchData {
    SearchData({
        required this.centerName,
        required this.address,
        required this.type,
    });

    final String centerName;
    final String address;
    final String type;

    factory SearchData.fromJson(Map<String, dynamic> json) => SearchData(
        centerName: json["center_name"],
        address: json["address"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "center_name": centerName,
        "address": address,
        "type": type,
    };
}
