import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_project/data/wishlist_items.dart';
import 'package:bloc_project/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemovefromWishlistEvent>(wishlistRemovefromWishlistEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) async {
    emit(WishlistLoadingState());

    await Future.delayed(Duration(seconds: 3), () {
      emit(WishlistSuccessState(wishlistItems: wishlistItems));
    });
  }

  FutureOr<void> wishlistRemovefromWishlistEvent(
      WishlistRemovefromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.productDataModel);
    emit(WishlistSuccessState(wishlistItems: List.from(wishlistItems)));
  }
}
