import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<NavigateToHomeScreen>(
        (NavigateToHomeScreen event, Emitter<SplashScreenState> emit) async {
      emit(SplashScreenInitial());

      await Future.delayed(const Duration(seconds: 5));

      emit(SplashScreenLoaded());
    });
  }
}
