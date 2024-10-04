import 'dart:convert';

class BiliBiliUserInfoModel {
  BiliBiliUserInfoModel({
    this.mid,
    this.uname,
    this.userid,
    this.sign,
    this.birthday,
    this.sex,
    this.nickFree,
    this.rank,
  });

  int? mid;
  String? uname;
  String? userid;
  String? sign;
  String? birthday;
  String? sex;
  bool? nickFree;
  String? rank;

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory BiliBiliUserInfoModel.fromJson(Map<String, dynamic> json) {
    return BiliBiliUserInfoModel(
      mid: int.parse(json["mid"]),
      uname: json["uname"],
      userid: json["userid"],
      sign: json["sign"],
      birthday: json["birthday"],
      sex: json["sex"],
      nickFree: json["nickFree"].toLowerCase() == 'true',
      rank: json["rank"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "mid": this.mid,
      "uname": this.uname,
      "userid": this.userid,
      "sign": this.sign,
      "birthday": this.birthday,
      "sex": this.sex,
      "nickFree": this.nickFree,
      "rank": this.rank,
    };
  }
}
