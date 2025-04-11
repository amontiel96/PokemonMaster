part of '../home_main_cubit.dart';

abstract class HomeMainState {}

class HomeMainInitial extends HomeMainState {}

class HomeMainLoaded extends HomeMainState {
  final bool isSuccess;

  HomeMainLoaded({required this.isSuccess});
}
