import 'dart:convert';

UserDataModel userDataFromJson(String str) =>
    UserDataModel.fromJson(json.decode(str));

String userDataToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
  int? userId;
  String? name;
  String? email;
  String? contact;
  String? summary;
  String? technicalSkill;
  String? experience;

  UserDataModel({
    this.userId,
    this.name,
    this.email,
    this.contact,
    this.summary,
    this.technicalSkill,
    this.experience,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        userId: json["userId"],
        name: json["name"],
        email: json["email"],
        contact: json["contact"],
        summary: json["summary"],
        technicalSkill: json["technicalSkill"],
        experience: json["experience"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "contact": contact,
        "summary": summary,
        "technicalSkill": technicalSkill,
        "experience": experience,
      };
}
