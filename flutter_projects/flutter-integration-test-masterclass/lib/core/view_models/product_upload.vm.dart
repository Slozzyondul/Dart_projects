import 'package:flutter/material.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';
import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/core/services/products.service.dart';
import 'package:flutter_starter/core/models/product_payload.model.dart';
import 'package:flutter_starter/core/extensions/product.extension.dart';
import 'package:flutter_starter/core/view_models/products_list.vm.dart';

class ProductUploadViewModel extends BaseViewModel {
  late ProductPayload payload;

  final formKey = GlobalKey<FormState>();
  final _productService = locator<ProductService>();

  void onNameChanged(String value) => payload = payload.copyWith(name: value);
  void onPriceChanged(String value) => payload = payload.copyWith(price: double.tryParse(value));

  void init(Product? productToEdit) {
    payload = productToEdit?.toPayload ?? ProductPayload(id: null, name: null, price: null);
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.nameRequired;
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.isEmpty) return l10n.priceRequired;
    if (double.tryParse(value) == null) return l10n.invalidPrice;
    return null;
  }

  Future<void> submit() async {
    if (!formKey.currentState!.validate()) return;
    try {
      setIsLoading(true);
      late Product respData;
      final productVm = locator<ProductsListViewModel>();
      if (payload.id == null) {
        respData = await _productService.addProduct(payload.toJson());
        productVm.addProduct(respData);
        displaySnackBar(l10n.productUploadSuccess);
      } else {
        respData = await _productService.updateProduct(payload.toJson());
        productVm.updateProduct(respData);
        displaySnackBar(l10n.productUpdateSuccess);
      }
      if (context.mounted) Navigator.pop(context);
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }
}
