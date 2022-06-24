import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/cart/bloc/cart_bloc.dart';

class ShoppingCartIcon extends StatelessWidget {
  ShoppingCartIcon({required this.isWhite});

  bool isWhite = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return state.cart.Products.isEmpty
              ? isWhite
                  ? Icon(
                      Icons.shopping_cart,
                      color: Colors.black.withOpacity(0.5),
                    )
                  : Icon(
                      Icons.shopping_cart,
                    )
              : Badge(
                  animationType: BadgeAnimationType.scale,
                  badgeContent: Text(
                    state.cart.Products.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                  ),
              
                  child: isWhite
                      ? Icon(
                          Icons.shopping_cart,
                          color: Colors.black.withOpacity(0.5),
                        )
                      : Icon(
                          Icons.shopping_cart,
                        ),
                );
        }
        if (state is CartLoading) {
          return isWhite
              ? Icon(
                  Icons.shopping_cart,
                  color: Colors.black.withOpacity(0.5),
                )
              : Icon(
                  Icons.shopping_cart,
                );
        }
        if (state is CartError) {
          return isWhite
              ? Icon(
                  Icons.shopping_cart,
                  color: Colors.black.withOpacity(0.5),
                )
              : Icon(
                  Icons.shopping_cart,
                );
        }

        return isWhite
            ? Icon(
                Icons.shopping_cart,
                color: Colors.black.withOpacity(0.5),
              )
            : Icon(
                Icons.shopping_cart,
              );
      },
    );
  }
}
