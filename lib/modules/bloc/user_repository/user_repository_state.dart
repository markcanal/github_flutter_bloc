part of 'user_repository_bloc.dart';

abstract class UserRepositoryState extends Equatable {
  const UserRepositoryState();

  @override
  List<Object> get props => [];
}

class UserRepositoryInitial extends UserRepositoryState {}

class UserRepositoryIsOnload extends UserRepositoryState {}

class UserRepositoryIsComplete extends UserRepositoryState {}

class UserRepositoryIsError extends UserRepositoryState {}
