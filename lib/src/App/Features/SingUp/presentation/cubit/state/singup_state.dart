part of '../singup_cubit.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupError extends SignupState {}

class SignupViewPasswordState extends SignupState {}

class SignupDataChangeState extends SignupState {}
