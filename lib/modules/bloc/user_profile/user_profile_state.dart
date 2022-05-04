part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileInLoadAll extends UserProfileState {
  const UserProfileInLoadAll(this.items);

  final List<GitHubUserModel> items;

  @override
  List<Object> get props => [items];
}

class UserProfileLoadAllError extends UserProfileState {
  const UserProfileLoadAllError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}

class UserProfileOnSearch extends UserProfileState {}

class UserProfileSearchFind extends UserProfileState {
  const UserProfileSearchFind(this.items);

  final GitHubProfileModel items;

  @override
  List<Object> get props => [items];
}
