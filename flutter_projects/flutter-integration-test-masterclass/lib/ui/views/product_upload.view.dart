import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/ui/views/base.view.dart';
import 'package:flutter_starter/ui/widgets/app_button.dart';
import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/ui/widgets/app_text_field.dart';
import 'package:flutter_starter/core/view_models/product_upload.vm.dart';

class ProductUploadView extends StatelessWidget {
  final Product? productToEdit;

  const ProductUploadView({super.key, this.productToEdit});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BaseView<ProductUploadViewModel>(
      initState: (vm) => vm.init(productToEdit),
      builder: (_, vm, __) {
        return Scaffold(
          appBar: AppBar(title: Text(productToEdit == null ? l10n.productUpload : l10n.updateProduct)),
          body: SafeArea(
            child: Form(
              key: vm.formKey,
              child: ListView(
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  AppTextField(
                    hintText: l10n.name,
                    validator: vm.nameValidator,
                    onChanged: vm.onNameChanged,
                    initialValue: vm.payload.name,
                  ),
                  AppTextField(
                    hintText: l10n.price,
                    validator: vm.priceValidator,
                    onChanged: vm.onPriceChanged,
                    initialValue: vm.payload.price?.toString(),
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  const SizedBox(height: 20),
                  AppButton(
                    onPressed: vm.submit,
                    isLoading: vm.isLoading,
                    title: productToEdit == null ? l10n.submit : l10n.update,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
