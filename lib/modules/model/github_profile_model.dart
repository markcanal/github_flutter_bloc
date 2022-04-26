// To parse this JSON data, do
//
//     final gitHubProfileModel = gitHubProfileModelFromJson(jsonString);

import 'dart:convert';

List<GitHubProfileModel> gitHubProfileModelFromJson(String str) =>
    List<GitHubProfileModel>.from(
        json.decode(str).map((x) => GitHubProfileModel.fromJson(x)));

String gitHubProfileModelToJson(List<GitHubProfileModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GitHubProfileModel {
  GitHubProfileModel({
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
  });

  String login;
  String avatarUrl;
  String htmlUrl;
  String name;
  String company;
  String blog;
  String location;
  int publicRepos;
  int publicGists;
  int followers;
  int following;

  factory GitHubProfileModel.fromJson(Map<String, dynamic> json) =>
      GitHubProfileModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
        name: json["name"],
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "avatar_url": avatarUrl,
        "html_url": htmlUrl,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
      };
}
