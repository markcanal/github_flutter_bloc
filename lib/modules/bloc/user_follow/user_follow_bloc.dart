import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_flutter_bloc/modules/model/github_user_follower.dart';
import 'package:github_flutter_bloc/modules/model/search_result_error.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

part 'user_follow_event.dart';
part 'user_follow_state.dart';

class UserFollowBloc extends Bloc<UserFollowEvent, UserFollowState> {
  UserFollowBloc(this.githubRepositorySearch) : super(UserFollowInitial()) {
    on<LoadFollower>((event, emit) => _loadFollower(event, emit));
  }

  final GithubRepositorySearch githubRepositorySearch;

  void _loadFollower(LoadFollower event, Emitter<UserFollowState> emit) async {
    emit(UserFollowerInit());
    try {
      if (event.name.isEmpty || event.name == '') {
        emit(UserFollowInitial());
      } else {
        String page = 'followers';
        final result = await githubRepositorySearch.getFollowerResults(
            name: event.name, link: page);
        emit(UserFollowerLoaded(result));
      }
    } catch (e) {
      emit(e is SearchResultError
          ? UserFollowerError(e.message)
          : const UserFollowerError('Something went wrong!'));
    }
  }
}
