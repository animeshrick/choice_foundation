class MakeupOptionsModel {
    MakeupOptionsModel({
        required this.makeupData,
        required this.msg,
        required this.responseCode,
    });

    final List<MakeupData> makeupData;
    final String msg;
    final int responseCode;

    factory MakeupOptionsModel.fromJson(Map<String, dynamic> json) => MakeupOptionsModel(
        makeupData: List<MakeupData>.from(json["makeupData"].map((x) => MakeupData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );

    Map<String, dynamic> toJson() => {
        "makeupData": List<dynamic>.from(makeupData.map((x) => x.toJson())),
        "msg": msg,
        "response_code": responseCode,
    };
}

class MakeupData {
    MakeupData({
        required this.id,
        required this.name,
        required this.price,
    });

    final int id;
    final String name;
    final String price;

    factory MakeupData.fromJson(Map<String, dynamic> json) => MakeupData(
        id: json["id"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
    };
}
