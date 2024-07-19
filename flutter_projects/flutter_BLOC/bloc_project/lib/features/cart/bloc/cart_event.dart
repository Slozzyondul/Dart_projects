part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartIntialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {}
