import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/cart_items.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    // Simulate a delay to show loading state
    await Future.delayed(Duration(seconds: 2), () {
      emit(CartSuccessState(cartItems: cartItems));
    });
  }
}
