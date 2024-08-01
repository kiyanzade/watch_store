part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {
  final String errorMessage;

  const HomeErrorState(this.errorMessage);
}

final class HomeSuccessLoadState extends HomeState {
  final HomeModel home;

  const HomeSuccessLoadState(this.home);
}
