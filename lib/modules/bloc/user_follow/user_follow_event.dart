part of 'user_follow_bloc.dart';

abstract class UserFollowEvent extends Equatable {
  const UserFollowEvent();

  @override
  List<Object> get props => [];
}

class LoadFollower extends UserFollowEvent {
  final String name;

  const LoadFollower({required this.name});

  @override
  List<Object> get props => [name];
}
