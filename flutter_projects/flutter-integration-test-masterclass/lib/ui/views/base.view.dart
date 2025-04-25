import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T)? dispose;
  final Function(T)? initState;
  final Widget Function(BuildContext context, T model, Widget? child) builder;

  const BaseView({
    super.key,
    this.dispose,
    this.initState,
    required this.builder,
  });

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  final T model = locator<T>();

  @override
  void initState() {
    if (widget.initState != null) widget.initState!(model);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    model.setBuildContext(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (widget.dispose != null) widget.dispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
