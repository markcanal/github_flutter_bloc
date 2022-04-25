part of 'user_repository_bloc.dart';

abstract class UserRepositoryEvent extends Equatable {
  const UserRepositoryEvent();

  // @override
  // List<Object> get props => [];
}

class OnPress extends UserRepositoryEvent {
  const OnPress({required this.text});

  final String text;

  @override
  List<Object> get props => [text];

  @override
  String toString() => 'Button Press with {search: $text}';
}
