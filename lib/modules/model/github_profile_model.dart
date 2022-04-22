// To parse this JSON data, do
//
//     final gitHubProfileModel = gitHubProfileModelFromJson(jsonString);

import 'dart:convert';

GitHubProfileModel gitHubProfileModelFromJson(String str) =>
    GitHubProfileModel.fromJson(json.decode(str));

String gitHubProfileModelToJson(GitHubProfileModel data) =>
    json.encode(data.toJson());

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

  final String login;
  final String avatarUrl;
  final String htmlUrl;
  final String name;
  final String company;
  final String blog;
  final String location;
  final int publicRepos;
  final int publicGists;
  final int followers;
  final int following;

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
