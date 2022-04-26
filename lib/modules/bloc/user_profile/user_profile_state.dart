part of 'user_profile_bloc.dart';

abstract class UserProfileState extends Equatable {
  const UserProfileState();

  @override
  List<Object> get props => [];
}

class UserProfileInitial extends UserProfileState {}

class UserProfileInLoadAll extends UserProfileState {
  const UserProfileInLoadAll(this.items);
  final List<GitHubProfileModel> items;

  @override
  List<Object> get props => [items];
}

class UserProfileInOnSearch extends UserProfileState {}

class UserProfileInSearchFind extends UserProfileState {
  const UserProfileInSearchFind(this.items);
  final List<GitHubProfileModel> items;
  @override
  List<Object> get props => [items];
}

class UserProfileInSearcError extends UserProfileState {
  const UserProfileInSearcError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
