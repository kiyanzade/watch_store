part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthSentCodeState extends AuthState {}

final class AuthVerifyCodeState extends AuthState {}

final class AuthLoggedInState extends AuthState {}

final class AuthLoggedOutState extends AuthState {}
