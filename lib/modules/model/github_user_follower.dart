// To parse this JSON data, do
//
//     final gitHubFollowerModel = gitHubFollowerModelFromJson(jsonString);

import 'dart:convert';

List<GitHubFollowerModel> gitHubFollowerModelFromJson(String str) =>
    List<GitHubFollowerModel>.from(
        json.decode(str).map((x) => GitHubFollowerModel.fromJson(x)));

String gitHubFollowerModelToJson(List<GitHubFollowerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GitHubFollowerModel {
  GitHubFollowerModel({
    this.login,
    this.avatarUrl,
    this.htmlUrl,
  });

  String? login;
  String? avatarUrl;
  String? htmlUrl;

  factory GitHubFollowerModel.fromJson(Map<String, dynamic> json) =>
      GitHubFollowerModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "html_url": htmlUrl,
      };
}
