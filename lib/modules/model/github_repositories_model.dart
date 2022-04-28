// To parse this JSON data, do
//
//     final gitHubRepositoriesModel = gitHubRepositoriesModelFromJson(jsonString);

import 'dart:convert';

import 'package:github_flutter_bloc/modules/model/github_user_model.dart';

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
  final GitHubUserModel owner;
  final String htmlUrl;
  final dynamic description;
  final String visibility;

  factory GitHubRepositoriesModel.fromJson(Map<String, dynamic> json) =>
      GitHubRepositoriesModel(
        name: json["name"],
        fullName: json["full_name"],
        owner: GitHubUserModel.fromJson(json["owner"]),
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
