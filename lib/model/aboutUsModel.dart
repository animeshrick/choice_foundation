class AboutUsModel {
    AboutUsModel({
        required this.data,
        required this.msg,
        required this.responseCode,
    });

    final Data data;
    final String msg;
    final int responseCode;

    factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
        data: Data.fromJson(json["data"]),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class Data {
    Data({
        required this.title,
        required this.description,
        required this.image,
    });

    final String title;
    final String description;
    final String image;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );
}
