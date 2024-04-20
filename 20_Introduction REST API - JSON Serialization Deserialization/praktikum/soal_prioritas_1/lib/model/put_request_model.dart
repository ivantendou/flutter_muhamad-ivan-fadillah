import 'dart:convert';

PutRequestModel putRequestModelFromJson(String str) => PutRequestModel.fromJson(json.decode(str));

String putRequestModelToJson(PutRequestModel data) => json.encode(data.toJson());

class PutRequestModel {
    int id;
    String title;
    String body;
    int userId;

    PutRequestModel({
        required this.id,
        required this.title,
        required this.body,
        required this.userId,
    });

    factory PutRequestModel.fromJson(Map<String, dynamic> json) => PutRequestModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
    };
}
