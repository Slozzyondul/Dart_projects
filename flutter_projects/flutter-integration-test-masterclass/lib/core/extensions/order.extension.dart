import 'package:collection/collection.dart';

import 'package:flutter_starter/core/models/cart.model.dart';
import 'package:flutter_starter/core/models/order_history.model.dart';
import 'package:flutter_starter/core/extensions/double.extension.dart';

extension OrderExtension on OrderHistory {
  CartItem? getCartProduct(int productId) {
    return items.firstWhereOrNull((i) => i.product.id == productId);
  }

  String get orderTotal {
    double total = 0;
    for (var item in items) {
      total += item.quantity * item.product.price;
    }
    return total.normalize;
  }
}
