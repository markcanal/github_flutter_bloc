part of 'user_following_bloc.dart';

abstract class UserFollowingEvent extends Equatable {
  const UserFollowingEvent();

  @override
  List<Object> get props => [];
}

class LoadFollowing extends UserFollowingEvent {
  final String name;

  const LoadFollowing({required this.name});

  @override
  List<Object> get props => [name];
}
