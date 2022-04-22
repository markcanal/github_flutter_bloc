part of 'user_repository_bloc.dart';

abstract class UserRepositoryEvent extends Equatable {
  const UserRepositoryEvent();

  @override
  List<Object> get props => [];
}

class OnPress extends UserRepositoryEvent {
  const OnPress({required this.search});

  final String search;

  @override
  List<Object> get props => [search];

  @override
  String toString() => 'Button Press with {search: $search}';
}
