import 'dart:async';

import 'package:ellipsis_rn_challenge/models/product_model/product_model.dart';

import '/catalog/catalog.dart';
import '../mock data/mock_data.dart';

const _delay = Duration(milliseconds: 800);

var data = product;

class ShoppingRepository {
  final _items = <ProductModel>[];

  Future<List<ProductModel>> loadCatalog() => Future.delayed(_delay, () => data.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList());

  Future<List<ProductModel>> loadCartProducts() => Future.delayed(_delay, () => _items);

  void addProductToCart(ProductModel item) => _items.add(item);

  void removeProductFromCart(ProductModel item) => _items.remove(item);
}
