part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState( {required this.error});
}

final class AuthSentCodeState extends AuthState {
  final String phoneNumber;

  AuthSentCodeState({required this.phoneNumber});
}

final class AuthVerifiedRegisteredCodeState extends AuthState {}
final class AuthVerifiedNotRegisteredCodeState extends AuthState {}

final class AuthLoggedInState extends AuthState {}

final class AuthLoggedOutState extends AuthState {}
