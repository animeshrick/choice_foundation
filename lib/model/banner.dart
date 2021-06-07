class BannerImage {
    BannerImage({
        required this.data,
        required this.msg,
        required this.responseCode,
    });

    final List<BannerImageData> data;
    final String msg;
    final int responseCode;

    factory BannerImage.fromJson(Map<String, dynamic> json) => BannerImage(
        data: List<BannerImageData>.from(json["data"].map((x) => BannerImageData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class BannerImageData {
    BannerImageData({
        // required this.id,
        required this.title,
        required this.description,
        required this.image,
    });

    // final int id;
    final String title;
    final String description;
    final String image;

    factory BannerImageData.fromJson(Map<String, dynamic> json) => BannerImageData(
        // id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
    );
}
