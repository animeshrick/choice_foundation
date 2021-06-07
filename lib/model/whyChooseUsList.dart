class WhyChooseUsList {
    WhyChooseUsList({
        required this.data,
        required this.msg,
        required this.responseCode,
    });

    final List<WhyChooseUsListData> data;
    final String msg;
    final int responseCode;

    factory WhyChooseUsList.fromJson(Map<String, dynamic> json) => WhyChooseUsList(
        data: List<WhyChooseUsListData>.from(json["data"].map((x) => WhyChooseUsListData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class WhyChooseUsListData {
    WhyChooseUsListData({
        required this.title,
        required this.description,
        required this.icon,
    });

    final String title;
    final String description;
    final String icon;

    factory WhyChooseUsListData.fromJson(Map<String, dynamic> json) => WhyChooseUsListData(
        title: json["title"],
        description: json["description"],
        icon: json["icon"],
    );
}
