class BridalBanner {
    BridalBanner({
        required this.beauticianBannerData,
        required this.msg,
        required this.responseCode,
    });

    final List<BeauticianBannerData> beauticianBannerData;
    final String msg;
    final int responseCode;

    factory BridalBanner.fromJson(Map<String, dynamic> json) => BridalBanner(
        beauticianBannerData: List<BeauticianBannerData>.from(json["beauticianBannerData"].map((x) => BeauticianBannerData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );

}

class BeauticianBannerData {
    BeauticianBannerData({
        required this.id,
        required this.title,
        required this.name,
        required this.image,
    });

    final int id;
    final String title;
    final String name;
    final String image;

    factory BeauticianBannerData.fromJson(Map<String, dynamic> json) => BeauticianBannerData(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        image: json["image"],
    );
}
