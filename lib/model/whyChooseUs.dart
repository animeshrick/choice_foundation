class WhyChooseUs {
    WhyChooseUs({
        required this.data,
        required this.msg,
        required this.responseCode,
    });

    final WhyChooseUsData data;
    final String msg;
    final int responseCode;

    factory WhyChooseUs.fromJson(Map<String, dynamic> json) => WhyChooseUs(
        data: WhyChooseUsData.fromJson(json["data"]),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class WhyChooseUsData {
    WhyChooseUsData({
        required this.title,
        required this.description,
    });

    final String title;
    final String description;

    factory WhyChooseUsData.fromJson(Map<String, dynamic> json) => WhyChooseUsData(
        title: json["title"],
        description: json["description"],
    );
}
