import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cart/cart.dart';
import '/catalog/catalog.dart';
import '../../models/product_model/product_model.dart';
import '../../widgets/cart_icon.dart';

class CatalogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CatalogAppBar(),
          const SliverToBoxAdapter(child: SizedBox(height: 12)),
          BlocBuilder<CatalogBloc, CatalogState>(
            builder: (context, state) {
              if (state is CatalogLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is CatalogLoaded) {
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(context, '/product-page', arguments: state.catalog.ProductsList[index]),
                      child: CatalogListProduct(
                        state.catalog.ProductsList[index],
                      ),
                    ),
                    childCount: state.catalog.ProductsList.length,
                  ),
                );
              }
              return const SliverFillRemaining(
                child: Text('Something went wrong!'),
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key, required this.item}) : super(key: key);

  final ProductModel
   item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CircularProgressIndicator();
        }
        if (state is CartLoaded) {
          final isInCart = state.cart.Products.contains(item);
          return IconButton(
              padding: EdgeInsets.all(0),
              onPressed: isInCart
                  ? null
                  : () => context.read<CartBloc>().add(CartProductAdded(item)),
              icon: isInCart
                  ? const Icon(Icons.check)
                  : const Icon(Icons.add_shopping_cart));
        }
        return const Text('Something went wrong!');
      },
    );
  }
}

class CatalogAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text('Products'),
      floating: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/cart'),
            child: ShoppingCartIcon(isWhite: false),
          ),
        ),
      ],
  );
  }
}

class CatalogListProduct extends StatelessWidget {
  const CatalogListProduct(this.item, {Key? key}) : super(key: key);

  final ProductModel
   item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      child: LimitedBox(
        maxHeight: 50,
        child: Container(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Image.network(
                  item.image!,
                  fit: BoxFit.cover,
                ),
                
              ),
              
              Expanded(
                  child: Row(
                children: [
                  Text(item.name!,
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Text(
                    item.detail!,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              )),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.price! + r" $",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Container(
                      child: AddButton(item: item),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
    );
  }
}
