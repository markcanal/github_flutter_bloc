// To parse this JSON data, do
//
//     final gitHubRepositoriesModel = gitHubRepositoriesModelFromJson(jsonString);

import 'dart:convert';

List<GitHubRepositoriesModel> gitHubRepositoriesModelFromJson(String str) =>
    List<GitHubRepositoriesModel>.from(
        json.decode(str).map((x) => GitHubRepositoriesModel.fromJson(x)));

String gitHubRepositoriesModelToJson(List<GitHubRepositoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GitHubRepositoriesModel {
  GitHubRepositoriesModel({
    required this.name,
    required this.fullName,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.visibility,
  });

  final String name;
  final String fullName;
  final Owner owner;
  final String htmlUrl;
  final dynamic description;
  final String visibility;

  factory GitHubRepositoriesModel.fromJson(Map<String, dynamic> json) =>
      GitHubRepositoriesModel(
        name: json["name"],
        fullName: json["full_name"],
        owner: Owner.fromJson(json["owner"]),
        htmlUrl: json["html_url"],
        description: json["description"],
        visibility: json["visibility"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "full_name": fullName,
        "owner": owner.toJson(),
        "html_url": htmlUrl,
        "description": description,
        "visibility": visibility,
      };
}

class Owner {
  Owner({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
  });

  final String login;
  final String avatarUrl;
  final String htmlUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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
