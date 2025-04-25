import 'package:flutter_starter/main.dart';
import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/models/cart.model.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';
import 'package:flutter_starter/core/services/cart.service.dart';

class HomeViewModel extends BaseViewModel {
  Cart? cart;
  int currentPageIndex = 0;

  final _cartService = locator<CartService>();

  void onDestinationSelected(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  Future<void> getCart() async {
    try {
      setIsLoading(true);
      cart = await _cartService.getCart();
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> updateCart(int productId, double quantity) async {
    if (isLoading) return;
    try {
      setIsLoading(true);
      cart = await _cartService.updateCart(productId: productId, quantity: quantity);
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> placeOrder() async {
    try {
      setIsLoading(true);
      await _cartService.placeOrder();
      cart = null;
      displaySnackBar(l10n.placeOrderSuccess);
      navigatorKey.currentState!.pop();
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }
}
