class GalleryModel {
    GalleryModel({
        required this.gallerydata,
        required this.msg,
        required this.responseCode,
    });

    final List<GalleryData> gallerydata;
    final String msg;
    final int responseCode;

    factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        gallerydata: List<GalleryData>.from(json["galleryData"].map((x) => GalleryData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class GalleryData {
    GalleryData({
        required this.id,
        required this.image,
    });

    final int id;
    final String? image;

    factory GalleryData.fromJson(Map<String, dynamic> json) => GalleryData(
        id: json["id"],
        image: json["image"],
    );
}
