import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:github_flutter_bloc/modules/model/github_profile_model.dart';
import 'package:github_flutter_bloc/modules/model/github_user_model.dart';
import 'package:github_flutter_bloc/modules/model/search_result_error.dart';
import 'package:github_flutter_bloc/service/repository/github_user_search.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(this.githubRepositorySearch) : super(UserProfileInitial()) {
    on<OnLoad>((event, emit) => _onLoad(event, emit));
    on<OnSearch>((event, emit) => _onSearch(event, emit));
  }

  final GithubRepositorySearch githubRepositorySearch;

  void _onLoad(OnLoad event, Emitter<UserProfileState> emit) async {
    emit(UserProfileInitial());

    try {
      emit(UserProfileInLoadStart());
      final result = await githubRepositorySearch.getUserList();
      emit(UserProfileInLoadAll(result));
    } catch (e) {
      emit(e is SearchResultError
          ? UserProfileLoadAllError(e.message)
          : const UserProfileLoadAllError('Something Went wrong'));
    }
  }

  void _onSearch(OnSearch event, Emitter<UserProfileState> emit) async {
    emit(UserProfileOnSearch());

    try {
      if (event.name.isEmpty || event.name == '') {
        emit(UserProfileInitial());
      } else {
        final result =
            await githubRepositorySearch.getUserProfile(name: event.name);
        emit(UserProfileSearchFind(result));
      }
    } catch (e) {
      emit(
        e is SearchResultError
            ? UserProfileLoadAllError(e.message)
            : const UserProfileLoadAllError('Something went wrong!'),
      );
    }
  }
}
