class BankDetailsModel {
    BankDetailsModel({
        required this.data,
        required this.msg,
        required this.responseCode,
    });

    final BankData data;
    final String msg;
    final int responseCode;

    factory BankDetailsModel.fromJson(Map<String, dynamic> json) => BankDetailsModel(
        data: BankData.fromJson(json["data"]),
        msg: json["msg"],
        responseCode: json["response_code"],
    );
}

class BankData {
    BankData({
        this.mobile,
        this.accountNo1,
        this.ifscCode1,
        this.bankName1,
        this.accountNo2,
        this.ifscCode2,
        this.bankName2,
    });

    final String? mobile;
    final String? accountNo1;
    final String? ifscCode1;
    final String? bankName1;
    final String? accountNo2;
    final String? ifscCode2;
    final String? bankName2;

    factory BankData.fromJson(Map<String, dynamic> json) => BankData(
        mobile: json["mobile"],
        accountNo1: json["account_no1"],
        ifscCode1: json["ifsc_code1"],
        bankName1: json["bank_name1"],
        accountNo2: json["account_no2"],
        ifscCode2: json["ifsc_code2"],
        bankName2: json["bank_name2"],
    );
}
