import 'dart:math';

import 'package:flutter/material.dart';

import '../catalog/view/catalog_page.dart';
import '../models/product_model/product_model.dart';
import '../widgets/cart_icon.dart';

class ProductPage extends StatefulWidget {

  ProductPage({this.productData});
  ProductModel? productData;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var _expanded = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    var productData =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    bool _firstPressed = true;

    return Builder(builder: (context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Product Page'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/cart'),
                child: ShoppingCartIcon(isWhite: false),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: <Widget>[
                Container(
                  color: Colors.white,
                  height: size.height * 0.3,
                  width: double.infinity,
                  child: Image.network(
                    productData.image!,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: size.width * 0.90,
                  child: Text(
                    productData.name!,
                    style: const TextStyle(
                        
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  width: size.width * 0.90,
                  child: Row(
                    children: [
                      Text(
                        productData.name!,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF7C7C7C),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Text(
                  productData.price! + r" $",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20.4,
                ),
                
                AddButton(item: productData),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                        height:
                            min(productData.detail!.length * 20.0 + 10, 150),
                        child: ListView(
                          children: [
                            Text(
                              productData.detail ?? '',
                              style: TextStyle(
                                letterSpacing: 0.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
