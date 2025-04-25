import 'package:flutter/material.dart';
import 'package:flutter_starter/core/models/product.model.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/widgets/list_is_empty.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/ui/views/product_upload.view.dart';
import 'package:flutter_starter/core/extensions/user.extension.dart';
import 'package:flutter_starter/core/view_models/products_list.vm.dart';
import 'package:flutter_starter/ui/widgets/products/product_block.dart';
import 'package:flutter_starter/ui/widgets/bottom_linear_indicator.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  void _gotoProductUploadForm(BuildContext context, [Product? productToEdit]) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => ProductUploadView(productToEdit: productToEdit),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authUser = locator<AuthService>().user!;
    return BaseView<ProductsListViewModel>(
      initState: (vm) => vm.getProducts(),
      builder: (_, vm, __) {
        if (vm.isLoading) return const BottomLinearIndicator();

        return Scaffold(
          floatingActionButton: authUser.isSeller == true
              ? FloatingActionButton(
                  child: const Icon(size: 30, Icons.add),
                  onPressed: () => _gotoProductUploadForm(context),
                )
              : null,
          body: vm.products.isEmpty
              ? ListIsEmpty()
              : ListView.builder(
                  itemCount: vm.products.length,
                  padding: const EdgeInsets.only(bottom: 90),
                  itemBuilder: (context, index) {
                    final product = vm.products[index];
                    return ProductBlock(
                      product: product,
                      hideCartActions: locator<AuthService>().user!.isSeller,
                      onPressedProduct: () => _gotoProductUploadForm(context, product),
                    );
                  },
                ),
        );
      },
    );
  }
}
