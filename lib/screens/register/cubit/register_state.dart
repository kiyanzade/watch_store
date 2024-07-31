part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {}

final class RegisterLocationPickedState extends RegisterState {
  final GeoPoint? location;

  RegisterLocationPickedState({required this.location});
}

final class RegisterOkResponseState extends RegisterState {}
