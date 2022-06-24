import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart/bloc/cart_bloc.dart';
import 'cart/view/cart_page.dart';
import 'catalog/bloc/catalog_bloc.dart';
import 'catalog/view/catalog_page.dart';
import 'pages/login_page.dart';
import 'pages/product_page.dart';
import 'repository/shopping_repository.dart';
import 'simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(MyApp(shoppingRepository: ShoppingRepository())),
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.shoppingRepository}) : super(key: key);

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EllipsisRnChallenge',
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/product-page': (context) => ProductPage(),
          '/catalog': (_) => CatalogPage(),
          '/cart': (_) => CartPage(),
        },
      ),
    );
  }
}
