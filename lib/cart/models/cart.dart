import 'package:equatable/equatable.dart';
import '../../models/product_model/product_model.dart';
import '/catalog/catalog.dart';

class Cart extends Equatable {
  const Cart({this.Products = const <ProductModel>[]});

  final List<ProductModel> Products;

  int get totalPrice {
    return Products.fold(0, (total, current) => total + int.parse(current.price!));
  }

  @override
  List<Object> get props => [Products];
}
