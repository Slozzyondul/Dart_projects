import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_starter/ui/widgets/snackbar.dart';
import 'package:flutter_starter/core/utils/api_error_handler.dart';

class BaseViewModel extends ChangeNotifier {
  bool _isLoading = false;
  late BuildContext context;
  late AppLocalizations l10n;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool get isLoading => _isLoading;

  setBuildContext(BuildContext buildContext) {
    context = buildContext;
    l10n = AppLocalizations.of(buildContext)!;
  }

  setIsLoading([bool loading = true, bool disableWidgetRebuild = false]) {
    _isLoading = loading;
    if (!disableWidgetRebuild) notifyListeners();
  }

  void displaySnackBar(String msg, {SnackStatus status = SnackStatus.success}) {
    if (msg.isEmpty) return;
    AppSnackBar(message: msg, type: status);
  }

  void displayApiError(dynamic error) {
    if (error.toString().isEmpty) return;
    AppSnackBar(type: SnackStatus.error, message: apiErrorHandler(error));
  }
}
