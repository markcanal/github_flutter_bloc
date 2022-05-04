part of 'user_following_bloc.dart';

abstract class UserFollowingState extends Equatable {
  const UserFollowingState();

  @override
  List<Object> get props => [];
}

class UserFollowingInitial extends UserFollowingState {}

class UserFollowingInit extends UserFollowingState {}

class UserFollowingLoaded extends UserFollowingState {
  final List<GitHubFollowingModel> items;

  const UserFollowingLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class UserFollowingError extends UserFollowingState {
  final String error;

  const UserFollowingError(this.error);

  @override
  List<Object> get props => [error];
}
