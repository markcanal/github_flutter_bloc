// To parse this JSON data, do
//
//     final gitHubFollowingModel = gitHubFollowingModelFromJson(jsonString);

import 'dart:convert';

List<GitHubFollowingModel> gitHubFollowingModelFromJson(String str) =>
    List<GitHubFollowingModel>.from(
        json.decode(str).map((x) => GitHubFollowingModel.fromJson(x)));

String gitHubFollowingModelToJson(List<GitHubFollowingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GitHubFollowingModel {
  GitHubFollowingModel({
    this.login,
    this.avatarUrl,
    this.htmlUrl,
  });

  String? login;
  String? avatarUrl;
  String? htmlUrl;

  factory GitHubFollowingModel.fromJson(Map<String, dynamic> json) =>
      GitHubFollowingModel(
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
