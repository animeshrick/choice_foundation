class DonationModel {
    DonationModel({
        required this.msg,
        required this.donationId,
        required this.responseCode,
    });

    final String msg;
    final int donationId;
    final int responseCode;

    factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
        msg: json["msg"],
        donationId: json["donation_id"],
        responseCode: json["response_code"],
    );
}
