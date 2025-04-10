part of '../home_main_cubit.dart';

abstract class HomeMainState {}

class HomeMainInitial extends HomeMainState {}

class HomeMainLoading extends HomeMainState {}
class HomeMainRedirectRegisterScreen extends HomeMainState {}
class HomeMainLayoutAuthScreenStart extends HomeMainState {}
class HomeMainOnBackHomeMain extends HomeMainState {}
class HomeMainShowState extends HomeMainState {}

class HomeMainLoaded extends HomeMainState {
  final bool isSuccess;

  HomeMainLoaded({required this.isSuccess});
}

class HomeMainError extends HomeMainState {}
class HomeMainEmailValidation extends HomeMainState {}