part of 'user_follow_bloc.dart';

abstract class UserFollowState extends Equatable {
  const UserFollowState();

  @override
  List<Object> get props => [];
}

class UserFollowInitial extends UserFollowState {}

class UserFollowerInit extends UserFollowState {}

class UserFollowerLoaded extends UserFollowState {
  final List<GitHubFollowerModel> items;

  const UserFollowerLoaded(this.items);

  @override
  List<Object> get props => [items];
}

class UserFollowerError extends UserFollowState {
  final String error;

  const UserFollowerError(this.error);

  @override
  List<Object> get props => [error];
}
