// To parse this JSON data, do
//
//     final adminModel = adminModelFromJson(jsonString);

import 'dart:convert';

AdminModel adminModelFromJson(String str) =>
    AdminModel.fromJson(json.decode(str));

class AdminModel {
  AdminModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.username,
    this.email,
    this.branchId,
    this.pictureUrl,
    this.roles,
    this.token,
    this.expiresOn,
  });

  String? username;
  dynamic email;
  int? branchId;
  dynamic pictureUrl;
  List<String>? roles;
  String? token;
  DateTime? expiresOn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        branchId: json["branchId"],
        pictureUrl: json["pictureUrl"],
        roles: List<String>.from(json["roles"].map((x) => x)),
        token: json["token"],
        expiresOn: DateTime.parse(json["expiresOn"]),
      );
}
