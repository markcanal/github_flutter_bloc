import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_flutter_bloc/modules/model/github_user_following.dart';
import 'package:github_flutter_bloc/modules/model/search_result_error.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

part 'user_following_event.dart';
part 'user_following_state.dart';

class UserFollowingBloc extends Bloc<UserFollowingEvent, UserFollowingState> {
  UserFollowingBloc(this.githubRepositorySearch)
      : super(UserFollowingInitial()) {
    on<LoadFollowing>(_loadFollowing);
  }

  final GithubRepositorySearch githubRepositorySearch;

  void _loadFollowing(
      LoadFollowing event, Emitter<UserFollowingState> emit) async {
    emit(UserFollowingInit());
    try {
      if (event.name.isEmpty || event.name == '') {
        emit(UserFollowingInitial());
      } else {
        String page = 'following';
        final result = await githubRepositorySearch.getFollowingResults(
            name: event.name, link: page);
        emit(UserFollowingLoaded(result));
      }
    } catch (e) {
      emit(e is SearchResultError
          ? UserFollowingError(e.message)
          : const UserFollowingError('Something went wrong!'));
    }
  }
}
