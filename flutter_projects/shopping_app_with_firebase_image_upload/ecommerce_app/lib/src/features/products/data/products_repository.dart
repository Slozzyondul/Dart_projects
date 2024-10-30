import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_repository.g.dart';

class ProductsRepository {
  const ProductsRepository(this._firestore);
  final FirebaseFirestore _firestore;

  //fetching data using future(one time reads at the start)
  Future<List<Product>> fetchProductsList() async {
    final ref = _firestore.collection('products').withConverter(
          fromFirestore: (doc, _) => Product.fromMap(doc.data()!),
          toFirestore: (product, _) => product.toMap(),
        );

    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

//fetching data using stream, real time listener
  Stream<List<Product>> watchProductsList() {
    final ref = _firestore.collection('products').withConverter(
          fromFirestore: (doc, _) => Product.fromMap(doc.data()!),
          toFirestore: (product, _) => product.toMap(),
        );
    return ref.snapshots().map((snapshot) =>
        snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList());
  }

//rendering data using stream, real time listener
  Stream<Product?> watchProduct(ProductID id) {
    final ref = _firestore.doc('products/$id').withConverter(
          fromFirestore: (doc, _) => Product.fromMap(doc.data()!),
          toFirestore: (product, _) => product.toMap(),
        );
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<List<Product>> searchProducts(String query) {
    return Future.value([]);
  }

  Future<void> createProduct(ProductID id, String imageUrl) {
    return _firestore.doc('products/$id').set(
      {
        'id': id,
        'imageUrl': imageUrl,
      },
      //to maintain old files if any are existing
      SetOptions(merge: true),
    );
  }

  Future<void> updateProduct(ProductID id, Product product) {
    final ref = _firestore.doc('products/$id').withConverter(
          fromFirestore: (doc, _) => Product.fromMap(doc.data()!),
          toFirestore: (product, _) => product.toMap(),
        );
    return ref.set(product, SetOptions(merge: true));
  }

  //method to delete product

  Future<void> deleteProduct(ProductID id) {
    return _firestore.doc('products/$id').delete();
  }
}

@Riverpod(keepAlive: true)
ProductsRepository productsRepository(ProductsRepositoryRef ref) {
  return ProductsRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Product>> productsListStream(ProductsListStreamRef ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductsList();
}

@riverpod
Future<List<Product>> productsListFuture(ProductsListFutureRef ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
}

@riverpod
Stream<Product?> product(ProductRef ref, ProductID id) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(id);
}

@riverpod
Future<List<Product>> productsListSearch(
    ProductsListSearchRef ref, String query) async {
  final link = ref.keepAlive();
  // a timer to be used by the callbacks below
  Timer? timer;
  // When the provider is destroyed, cancel the http request and the timer
  ref.onDispose(() {
    timer?.cancel();
  });
  // When the last listener is removed, start a timer to dispose the cached data
  ref.onCancel(() {
    // start a 30 second timer
    timer = Timer(const Duration(seconds: 30), () {
      // dispose on timeout
      link.close();
    });
  });
  // If the provider is listened again after it was paused, cancel the timer
  ref.onResume(() {
    timer?.cancel();
  });
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.searchProducts(query);
}
