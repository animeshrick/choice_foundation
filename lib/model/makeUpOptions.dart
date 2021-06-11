class MakeupOptionsModel {
    MakeupOptionsModel({
        required this.makeupData,
        required this.msg,
        required this.responseCode,
    });

    final List<MakeupDatum> makeupData;
    final String msg;
    final int responseCode;

    factory MakeupOptionsModel.fromJson(Map<String, dynamic> json) => MakeupOptionsModel(
        makeupData: List<MakeupDatum>.from(json["makeupData"].map((x) => MakeupDatum.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );

    Map<String, dynamic> toJson() => {
        "makeupData": List<dynamic>.from(makeupData.map((x) => x.toJson())),
        "msg": msg,
        "response_code": responseCode,
    };
}

class MakeupDatum {
    MakeupDatum({
        required this.id,
        required this.name,
        required this.price,
    });

    final int id;
    final String name;
    final String price;

    factory MakeupDatum.fromJson(Map<String, dynamic> json) => MakeupDatum(
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
