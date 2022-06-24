import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../catalog/catalog.dart';
import '../../widgets/cart_items.dart';
import '../bloc/cart_bloc.dart';


class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Scaffold(body: CartList()),
          ),
          CartTotal()
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart Page")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is CartLoaded) {
            return ListView.separated(
              itemCount: state.cart.Products.length,
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemBuilder: (context, index) {
                final item = state.cart.Products[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CartProductCard(item),
                );
              },
            );
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Something went wrong!'),
                SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {
                    context.read<CatalogBloc>().add(CatalogStarted());
                    context.read<CartBloc>().add(CartStarted());
                  },
                  child: Text('Retry'),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoaded) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 60,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${state.cart.totalPrice}' + r" $",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
