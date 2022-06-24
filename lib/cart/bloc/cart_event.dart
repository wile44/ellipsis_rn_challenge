part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  const CartProductAdded(this.item);

  final ProductModel item;

  @override
  List<Object> get props => [item];
}

class CartProductRemoved extends CartEvent {
  const CartProductRemoved(this.item);

  final ProductModel item;

  @override
  List<Object> get props => [item];
}
