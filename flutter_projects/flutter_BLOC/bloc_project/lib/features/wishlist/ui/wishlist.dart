import 'package:bloc_project/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    super.initState();
    wishlistBloc.add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wishlist items"),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) => {},
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          if (state is WishlistLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is WishlistSuccessState) {
            final successState = state as WishlistSuccessState;
            return ListView.builder(
              itemCount: successState.wishlistItems.length,
              itemBuilder: (context, index) {
                return WishlistTileWidget(
                  wishlistBloc: wishlistBloc,
                  productDataModel: successState.wishlistItems[index],
                );
              },
            );
          } else {
            return Center(child: Text("No items in wishlist"));
          }
        },
      ),
    );
  }
}
