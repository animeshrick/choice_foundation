class BridalFormModel {
    BridalFormModel({
        required this.msg,
        required this.bridalBookingId,
        required this.responseCode,
    });

    final String msg;
    final int bridalBookingId;
    final int responseCode;

    factory BridalFormModel.fromJson(Map<String, dynamic> json) => BridalFormModel(
        msg: json["msg"],
        bridalBookingId: json["bridal_booking_id"],
        responseCode: json["response_code"],
    );

    Map<String, dynamic> toJson() => {
        "msg": msg,
        "bridal_booking_id": bridalBookingId,
        "response_code": responseCode,
    };
}
