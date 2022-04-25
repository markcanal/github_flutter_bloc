part of 'user_repository_bloc.dart';

abstract class UserRepositoryState extends Equatable {
  const UserRepositoryState();

  @override
  List<Object> get props => [];
}

class UserRepositoryInitial extends UserRepositoryState {}

// class UserRepositoryIsEmpty extends UserRepositoryState {}

class UserRepositoryIsOnload extends UserRepositoryState {}

class UserRepositoryIsComplete extends UserRepositoryState {
  const UserRepositoryIsComplete(this.items);

  final List<GitHubRepositoriesModel> items;

  @override
  List<Object> get props => [items];
}

class UserRepositoryIsError extends UserRepositoryState {
  const UserRepositoryIsError({required this.error});
  final String error;
  @override
  List<Object> get props => [error];
}
