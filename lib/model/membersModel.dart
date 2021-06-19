class MembersModel {
  MembersModel({
    required this.memberData,
    required this.msg,
    required this.responseCode,
  });

  final List<MemberData> memberData;
  final String msg;
  final int responseCode;

  factory MembersModel.fromJson(Map<String, dynamic> json) => MembersModel(
        memberData: List<MemberData>.from(
            json["memberData"].map((x) => MemberData.fromJson(x))),
        msg: json["msg"],
        responseCode: json["response_code"],
      );
}

class MemberData {
  MemberData({
    required this.id,
    required this.name,
    required this.designation,
    required this.image,
    required this.facebook,
    required this.twitter,
    required this.instagram,
  });

  final int id;
  final String name;
  final String designation;
  final String image;
  final String facebook;
  final String twitter;
  final String instagram;

  factory MemberData.fromJson(Map<String, dynamic> json) => MemberData(
        id: json["id"],
        name: json["name"],
        designation: json["designation"],
        image: json["image"],
        facebook: json["facebook"] == null ? '' : json["facebook"],
        twitter: json["twitter"] == null ? '' : json["twitter"],
        instagram: json["instagram"] == null ? '' : json["instagram"],
      );
}
