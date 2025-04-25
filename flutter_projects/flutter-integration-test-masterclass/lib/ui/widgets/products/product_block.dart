import 'package:flutter/material.dart';

import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/core/view_models/home.vm.dart';
import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/core/extensions/cart.extension.dart';
import 'package:flutter_starter/core/extensions/double.extension.dart';

class ProductBlock extends StatelessWidget {
  final Product product;
  final bool hideCartActions;
  final Function()? onCartUpdated;
  final Function()? onPressedProduct;

  const ProductBlock({
    super.key,
    this.onCartUpdated,
    this.onPressedProduct,
    required this.product,
    this.hideCartActions = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    return BaseView<HomeViewModel>(
      builder: (_, homeVm, __) {
        final cartItem = homeVm.cart?.getCartProduct(product.id);

        return Column(
          children: [
            ListTile(
              onTap: onPressedProduct,
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
              trailing: Text(
                "\$${product.price.normalize}",
                style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              subtitle: Text(
                product.sellerName.toUpperCase(),
                style: tt.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
            ),
            if (!hideCartActions) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (cartItem?.quantity != null)
                    IconButton(
                      onPressed: () async {
                        final q = (cartItem?.quantity ?? 1) - 1;
                        await homeVm.updateCart(product.id, q);
                        if (onCartUpdated != null) onCartUpdated!();
                      },
                      icon: Icon(Icons.indeterminate_check_box, size: 30, color: theme.primaryColor),
                    ),
                  SizedBox(
                    width: 70,
                    child: cartItem == null
                        ? null
                        : Align(
                            alignment: Alignment.center,
                            child: Text(
                              cartItem.quantity.normalize,
                              style: tt.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: Colors.black54),
                            ),
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      final q = (cartItem?.quantity ?? 0) + 1;
                      homeVm.updateCart(product.id, q);
                    },
                    icon: Icon(Icons.add_box, size: 30, color: theme.primaryColor),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              const SizedBox(height: 10),
            ],
            const Divider(color: Colors.black12),
          ],
        );
      },
    );
  }
}
