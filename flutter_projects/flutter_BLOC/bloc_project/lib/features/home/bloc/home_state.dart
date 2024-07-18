part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

class HomeLoadedSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeState {}

class HomeNavigateToCartPageActionState extends HomeState {}
