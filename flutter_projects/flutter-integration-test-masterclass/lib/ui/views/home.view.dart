import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/views/cart.view.dart';
import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/widgets/app_button.dart';
import 'package:flutter_starter/core/view_models/home.vm.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/ui/views/products_list.view.dart';
import 'package:flutter_starter/ui/views/order_history.view.dart';
import 'package:flutter_starter/ui/widgets/activity_indicator.dart';
import 'package:flutter_starter/core/extensions/user.extension.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    final tt = theme.textTheme;
    final isSeller = locator<AuthService>().user!.isSeller;

    final homeLabel = isSeller ? l10n.myInventory : l10n.home;
    final destinations = <Widget>[
      NavigationDestination(tooltip: homeLabel, icon: const Icon(Icons.home), label: homeLabel),
      NavigationDestination(label: l10n.orderHistory, tooltip: l10n.orderHistory, icon: const Icon(Icons.rotate_left)),
    ];

    return BaseView<HomeViewModel>(
      initState: isSeller ? null : (vm) => vm.getCart(),
      builder: (_, vm, __) {
        final appBarTitle = (destinations[vm.currentPageIndex] as NavigationDestination).label;
        return Scaffold(
          key: vm.scaffoldKey,
          appBar: AppBar(
            title: Text(appBarTitle),
            actions: [
              IconButton(
                icon: Icon(Icons.logout, size: 20),
                onPressed: () {
                  vm.scaffoldKey.currentState!.showBottomSheet(
                    backgroundColor: Colors.grey.shade200,
                    constraints: BoxConstraints(maxHeight: 250),
                    (_) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text(l10n.areYouSure, style: tt.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 40),
                            AppButton(
                              title: l10n.logout,
                              onPressed: locator<AuthService>().logout,
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
                      );
                    },
                  );
                },
              )
            ],
          ),
          floatingActionButton: vm.currentPageIndex != 0
              ? null
              : vm.isLoading
                  ? SizedBox(width: 30, height: 30, child: const ActivityIndicator(dark: true))
                  : vm.cart == null
                      ? null
                      : Badge(
                          offset: const Offset(0, 0),
                          label: Text(
                            "${vm.cart!.items.length}",
                            style:
                                theme.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          child: FloatingActionButton(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 3),
                              child: const Icon(size: 30, Icons.trolley),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(fullscreenDialog: true, builder: (_) => CartView()),
                              );
                            },
                          ),
                        ),
          bottomNavigationBar: NavigationBar(
            destinations: destinations,
            selectedIndex: vm.currentPageIndex,
            onDestinationSelected: vm.onDestinationSelected,
          ),
          body: <Widget>[
            ProductsListView(),
            OrderHistoryView(),
          ][vm.currentPageIndex],
        );
      },
    );
  }
}
