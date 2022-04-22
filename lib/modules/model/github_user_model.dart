// To parse this JSON data, do
//
//     final gitHubUserModel = gitHubUserModelFromJson(jsonString);

import 'dart:convert';

List<GitHubUserModel> gitHubUserModelFromJson(String str) =>
    List<GitHubUserModel>.from(
        json.decode(str).map((x) => GitHubUserModel.fromJson(x)));

String gitHubUserModelToJson(List<GitHubUserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GitHubUserModel {
  GitHubUserModel({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  final String login;
  final String avatarUrl;
  final String htmlUrl;

  factory GitHubUserModel.fromJson(Map<String, dynamic> json) =>
      GitHubUserModel(
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
