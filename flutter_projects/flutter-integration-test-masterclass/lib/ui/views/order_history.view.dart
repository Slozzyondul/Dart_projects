import 'package:flutter/material.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/widgets/list_is_empty.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/ui/views/order_details.view.dart';
import 'package:flutter_starter/ui/widgets/bottom_linear_indicator.dart';
import 'package:flutter_starter/core/services/order_history.service.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tt = theme.textTheme;
    final authUser = locator<AuthService>().user;

    return FutureBuilder(
      future: locator<OrderHistoryService>().getOrderHistory(),
      builder: (_, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return const BottomLinearIndicator();
        if (snapshot.hasError) return Center(child: Text(snapshot.error.toString()));
        final orders = snapshot.data!;
        if (orders.isEmpty) return ListIsEmpty();
        return ListView.builder(
          itemCount: orders.length,
          itemBuilder: (context, index) {
            final order = orders[index];
            final orderName = authUser!.accountType == "seller" ? order.buyerName : order.sellerName;
            return Column(
              children: [
                ListTile(
                  leading: Text(
                    "${order.id}",
                    style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    orderName,
                    style: tt.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${order.items.length} products",
                    style: tt.titleSmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => OrderDetailsView(order: order, appBarTitle: orderName)),
                    );
                  },
                ),
                const SizedBox(height: 10),
                const Divider(color: Colors.black12),
              ],
            );
          },
        );
      },
    );
  }
}
