import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/widgets/app_button.dart';
import 'package:flutter_starter/core/view_models/home.vm.dart';
import 'package:flutter_starter/core/extensions/cart.extension.dart';
import 'package:flutter_starter/ui/widgets/products/product_block.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final tt = theme.textTheme;
    return BaseView<HomeViewModel>(
      builder: (_, vm, __) {
        final cart = vm.cart;
        if (cart == null) return SizedBox();
        return Scaffold(
          appBar: AppBar(title: Text(l10n.cart)),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.items.length,
                  itemBuilder: (context, index) {
                    final cartProduct = cart.items[index].product;
                    return ProductBlock(
                      product: cartProduct,
                      onCartUpdated: () {
                        if (vm.cart == null) Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${l10n.total}: ",
                        style: tt.titleLarge?.copyWith(letterSpacing: 1),
                      ),
                      TextSpan(
                        text: "\$${cart.cartTotal}",
                        style: tt.displaySmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                      )
                    ],
                  ),
                ),
              ),
              SafeArea(
                child: AppButton(
                  isLoading: vm.isLoading,
                  title: l10n.placeOrder.toUpperCase(),
                  onPressed: () {
                    showBottomSheet(
                      context: vm.context,
                      backgroundColor: Colors.grey.shade200,
                      constraints: BoxConstraints(maxHeight: 250),
                      builder: (_) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          child: SafeArea(
                            child: Column(
                              children: [
                                Text(l10n.pleaseConfirm, style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                                const SizedBox(height: 40),
                                AppButton(
                                  title: l10n.placeOrder,
                                  backgroundColor: theme.colorScheme.primary,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    vm.placeOrder();
                                  },
                                ),
                                const SizedBox(height: 10),
                                AppButton(
                                  outlined: true,
                                  title: l10n.cancel,
                                  fixedSize: Size(double.maxFinite, 50),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
