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
    this.login,
    this.avatarUrl,
    this.htmlUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
  });

  String? login;
  String? avatarUrl;
  String? htmlUrl;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;

  factory GitHubProfileModel.fromJson(Map<String, dynamic> json) =>
      GitHubProfileModel(
        login: json["login"],
        avatarUrl: json["avatar_url"],
        htmlUrl: json["html_url"],
        name: json["name"],
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        twitterUsername: json["twitter_username"],
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
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
      };
}
