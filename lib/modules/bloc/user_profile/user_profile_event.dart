part of 'user_profile_bloc.dart';

abstract class UserProfileEvent extends Equatable {
  const UserProfileEvent();

  @override
  List<Object> get props => [];
}

class OnLoad extends UserProfileEvent {
  const OnLoad();
}

class OnSearch extends UserProfileEvent {
  const OnSearch({required this.name});
  final String name;

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'Search $name';
}
