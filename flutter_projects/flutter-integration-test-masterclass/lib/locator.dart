import 'package:get_it/get_it.dart';

import 'package:flutter_starter/core/view_models/home.vm.dart';
import 'package:flutter_starter/core/view_models/login.vm.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/core/services/base.service.dart';
import 'package:flutter_starter/core/services/cart.service.dart';
import 'package:flutter_starter/core/view_models/sign_up.vm.dart';
import 'package:flutter_starter/core/services/products.service.dart';
import 'package:flutter_starter/core/view_models/products_list.vm.dart';
import 'package:flutter_starter/core/view_models/product_upload.vm.dart';
import 'package:flutter_starter/core/services/order_history.service.dart';
import 'package:flutter_starter/core/services/secure_storage.service.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // SecureStorageService has to be the first to be initialized.
  locator.registerSingleton(SecureStorageService());

  locator.registerSingleton(BaseService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => CartService());
  locator.registerLazySingleton(() => ProductService());
  locator.registerLazySingleton(() => OrderHistoryService());

  locator.registerFactory(() => LoginViewModel());
  locator.registerLazySingleton(() => HomeViewModel());
  locator.registerLazySingleton(() => SignUpViewModel());
  locator.registerLazySingleton(() => ProductsListViewModel());
  locator.registerLazySingleton(() => ProductUploadViewModel());
}

Future<void> resetLazySingletons() async {
  await locator.resetLazySingleton<HomeViewModel>();
  await locator.resetLazySingleton<SignUpViewModel>();
  await locator.resetLazySingleton<ProductsListViewModel>();
  await locator.resetLazySingleton<ProductUploadViewModel>();
}
