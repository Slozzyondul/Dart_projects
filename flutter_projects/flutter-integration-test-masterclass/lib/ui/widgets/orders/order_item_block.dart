import 'package:flutter/material.dart';

import 'package:flutter_starter/core/models/cart.model.dart';
import 'package:flutter_starter/core/extensions/double.extension.dart';

class OrderItemBlock extends StatelessWidget {
  final CartItem orderItem;

  const OrderItemBlock({super.key, required this.orderItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final product = orderItem.product;
    return Column(
      children: [
        ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(width: 2, color: Colors.grey.shade300),
            ),
            child: Icon(Icons.shopping_basket_rounded, size: 25, color: Colors.grey.shade400),
          ),
          title: Text(
            product.name,
            style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          trailing: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: orderItem.quantity.normalize,
                  style: tt.bodyLarge?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                TextSpan(text: " x ", style: tt.bodyLarge),
                TextSpan(
                  text: "\$${product.price.normalize}",
                  style: tt.bodyLarge?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                )
              ],
            ),
          ),
        ),
        const Divider(color: Colors.black12),
      ],
    );
  }
}
