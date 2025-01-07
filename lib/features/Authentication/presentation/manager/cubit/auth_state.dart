part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// Login
final class AuthLoadingLogin extends AuthState {}

final class AuthSuccessLogin extends AuthState {
  final User user;

  AuthSuccessLogin(this.user);
}

final class AuthFailedLogin extends AuthState {
  final String massage;

  AuthFailedLogin(this.massage);
}

// Register
final class AuthLoadingRegister extends AuthState {}

final class AuthSuccessRegister extends AuthState {
  final User user;

  AuthSuccessRegister(this.user);
}

final class AuthFailedRegister extends AuthState {
  final String massage;

  AuthFailedRegister(this.massage);
}

// Logout
final class AuthSuccessLogout extends AuthState {}

final class AuthLoadingLogout extends AuthState {}

final class AuthFailedLogout extends AuthState {
  final String massage;

  AuthFailedLogout(this.massage);
}
