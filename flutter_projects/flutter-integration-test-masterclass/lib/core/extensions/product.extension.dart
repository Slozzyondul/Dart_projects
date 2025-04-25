import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/core/models/product_payload.model.dart';

extension ProductExtension on Product {
  ProductPayload get toPayload => ProductPayload(id: id, name: name, price: price);
}
