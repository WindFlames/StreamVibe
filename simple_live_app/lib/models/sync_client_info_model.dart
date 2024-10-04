import 'dart:convert';


class SyncClientInfoModel {
  SyncClientInfoModel({
    required this.name,
    required this.version,
    required this.address,
    required this.port,
    required this.type,
  });


  String type;
  String name;
  String version;
  String address;
  int port;

  @override
  String toString() {
    return jsonEncode(this);
  }

  factory SyncClientInfoModel.fromJson(Map<String, dynamic> json) {
    return SyncClientInfoModel(
      type: json["type"],
      name: json["name"],
      version: json["version"],
      address: json["address"],
      port: int.parse(json["port"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "type": this.type,
      "name": this.name,
      "version": this.version,
      "address": this.address,
      "port": this.port,
    };
  }
}
