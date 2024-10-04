import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()
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

  /// Connect the generated [_$PersonFromJson] function to the `fromJson`
  /// factory.
  factory BiliBiliUserInfoModel.fromJson(Map<String, dynamic> json) => _$BiliBiliUserInfoModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BiliBiliUserInfoModelToJson(this);
}
