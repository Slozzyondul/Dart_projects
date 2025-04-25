import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/core/models/order_history.model.dart';
import 'package:flutter_starter/core/extensions/order.extension.dart';
import 'package:flutter_starter/ui/widgets/orders/order_item_block.dart';

class OrderDetailsView extends StatelessWidget {
  final String appBarTitle;
  final OrderHistory order;

  const OrderDetailsView({super.key, required this.order, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final tt = theme.textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final orderItem = order.items[index];
                  return OrderItemBlock(orderItem: orderItem);
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
                      text: "\$${order.orderTotal}",
                      style: tt.displaySmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
