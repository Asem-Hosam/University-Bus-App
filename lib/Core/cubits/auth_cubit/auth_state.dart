part of 'auth_cubit.dart';

abstract class AuthState {}

//Login
class IsSecurePasswordCheck extends AuthState {}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  LoginSuccess({required this.role});
  String role;
}

class LoginFailure extends AuthState {
  LoginFailure({required this.errorMessage});
  String errorMessage;
}

//SginUp

final class SginupInitial extends AuthState {}

final class SginupLoading extends AuthState {}

final class SginupSucces extends AuthState {}

final class SginupFailure extends AuthState {
  SginupFailure({required this.errorMessage});
  String errorMessage;
}

//Ui
class UiUpadateInitial extends AuthState {}
