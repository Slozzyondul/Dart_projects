import 'package:bloc_project/features/cart/ui/cart.dart';
import 'package:bloc_project/features/home/bloc/home_bloc.dart';
import 'package:bloc_project/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) {
        print("listenWhen: previous - $previous, current - $current");
        return current is HomeNavigateToWishlistPageActionState ||
            current is HomeNavigateToCartPageActionState;
      },
      buildWhen: (previous, current) {
        print("buildWhen: previous - $previous, current - $current");
        return current is! HomeNavigateToWishlistPageActionState &&
            current is! HomeNavigateToCartPageActionState;
      },
      listener: (context, state) {
        print("listener: state - $state");
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Cart(),
            ),
          );
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Wishlist(),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishlistButtonNavigateEvent());
                    },
                    icon: Icon(Icons.favorite),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigateEvent());
                    },
                    icon: Icon(Icons.shopping_bag),
                  ),
                ],
                title: Center(
                  child: Text(
                    "groceries",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
                backgroundColor: Colors.yellowAccent,
              ),
            );
          case HomeErrorState:
            return Scaffold(
              body: Center(
                child: Text(
                  "An error occurred",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
