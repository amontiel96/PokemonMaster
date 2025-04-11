part of '../favorite_cubit.dart';

abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final bool isSuccess;

  FavoriteLoaded({required this.isSuccess});
}

class FavoriteError extends FavoriteState {}