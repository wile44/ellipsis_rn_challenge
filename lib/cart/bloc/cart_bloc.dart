import 'package:bloc/bloc.dart';
import 'package:ellipsis_rn_challenge/models/product_model/product_model.dart';
import 'package:equatable/equatable.dart';
import '../../repository/shopping_repository.dart';
import '/cart/cart.dart';


part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required this.shoppingRepository}) : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartProductAdded>(_onProductAdded);
    on<CartProductRemoved>(_onProductRemoved);
  }

  final ShoppingRepository shoppingRepository;

  void _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());
    try {
      final Products = await shoppingRepository.loadCartProducts();
      emit(CartLoaded(cart: Cart(Products: [...Products])));
    } catch (_) {
      emit(CartError());
    }
  }

  void _onProductAdded(CartProductAdded event, Emitter<CartState> emit) async {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.addProductToCart(event.item);
        emit(CartLoaded(cart: Cart(Products: [...state.cart.Products, event.item])));
      } catch (_) {
        emit(CartError());
      }
    }
  }

  void _onProductRemoved(CartProductRemoved event, Emitter<CartState> emit) {
    final state = this.state;
    if (state is CartLoaded) {
      try {
        shoppingRepository.removeProductFromCart(event.item);
        emit(
          CartLoaded(
            cart: Cart(
              Products: [...state.cart.Products]..remove(event.item),
            ),
          ),
        );
      } catch (_) {
        emit(CartError());
      }
    }
  }
}
