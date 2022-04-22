import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_repository_event.dart';
part 'user_repository_state.dart';

class UserRepositoryBloc
    extends Bloc<UserRepositoryEvent, UserRepositoryState> {
  UserRepositoryBloc() : super(UserRepositoryInitial()) {
    on<UserRepositoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
