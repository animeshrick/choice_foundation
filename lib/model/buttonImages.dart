class ButtomImages {
    ButtomImages({
        required this.btnImagesdata,
        required this.msg,
        required this.responseCode,
    });

    final List<ButtomImageData> btnImagesdata;
    final String msg;
    final int responseCode;

    factory ButtomImages.fromJson(Map<String, dynamic> json) => ButtomImages(
        btnImagesdata: List<ButtomImageData>.from(json["data"].map((x) => ButtomImageData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class ButtomImageData {
    ButtomImageData({
        required this.id,
        required this.name,
        required this.image,
    });

    final int id;
    final String name;
    final String image;

    factory ButtomImageData.fromJson(Map<String, dynamic> json) => ButtomImageData(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );
}
