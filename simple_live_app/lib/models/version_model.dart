import 'dart:convert';

class VersionModel {
  VersionModel({
    required this.version,
    required this.versionNum,
    required this.versionDesc,
    required this.downloadUrl,
  });



  String version;
  int versionNum;
  String versionDesc;
  String downloadUrl;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() {
    return {
      "version": this.version,
      "versionNum": this.versionNum,
      "versionDesc": this.versionDesc,
      "downloadUrl": this.downloadUrl,
    };
  }

  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      version: json["version"],
      versionNum: int.parse(json["versionNum"]),
      versionDesc: json["versionDesc"],
      downloadUrl: json["downloadUrl"],
    );
  }
}
