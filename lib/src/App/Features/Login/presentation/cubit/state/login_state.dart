part of '../login_cubit.dart';

abstract class LoginState {}

class PreLoginInitial extends LoginState {}

class PreLoginLoading extends LoginState {}

class PreLoginRedirectRegisterScreen extends LoginState {}


class PreLoginLoaded extends LoginState {
  final bool isSuccess;
  final bool isEmailValid;
  final String errorMessage;

  PreLoginLoaded({
    required this.isSuccess,
    required this.isEmailValid,
    required this.errorMessage,
  });
}

class PreLoginError extends LoginState {}

class PreLoginEmailValidation extends LoginState {}
