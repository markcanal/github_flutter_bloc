import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_flutter_bloc/modules/model/github_repositories_model.dart';
import 'package:github_flutter_bloc/modules/model/search_result_error.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

part 'user_repository_event.dart';
part 'user_repository_state.dart';

class UserRepositoryBloc
    extends Bloc<UserRepositoryEvent, UserRepositoryState> {
  UserRepositoryBloc({required this.githubRepositorySearch})
      : super(UserRepositoryInitial()) {
    on<OnPress>(_onPressed);
  }
  final GithubRepositorySearch githubRepositorySearch;

  void _onPressed(OnPress event, Emitter<UserRepositoryState> emit) async {
    final searchText = event.text;

    if (searchText.isEmpty) return emit(UserRepositoryInitial());

    emit(UserRepositoryIsOnload());

    try {
      final results = await githubRepositorySearch.getRepositoryOf(searchText);

      emit(UserRepositoryIsComplete(results));
    } catch (e) {
      emit(
        e is SearchResultError
            ? UserRepositoryIsError(error: e.message)
            : const UserRepositoryIsError(error: 'Something Went wrong'),
      );
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
