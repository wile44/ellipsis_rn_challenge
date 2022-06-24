import 'package:ellipsis_rn_challenge/models/product_model/product_model.dart';
import 'package:equatable/equatable.dart';
import '/catalog/catalog.dart';

class Catalog extends Equatable {
  Catalog({required this.ProductsList});



  final List<ProductModel> ProductsList;



  @override
  List<Object> get props => [ProductsList];
}
