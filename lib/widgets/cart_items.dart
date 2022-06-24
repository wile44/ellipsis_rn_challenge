import 'package:ellipsis_rn_challenge/models/product_model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/bloc/cart_bloc.dart';


class CartProductCard extends StatelessWidget {
  final ProductModel product;

  const CartProductCard(this.product);

  @override
  Widget build(BuildContext context) {
      final bloc = context.watch<CartBloc>();

    return Stack(
      children: <Widget>[
        Container(
    
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                  color: Colors.blue.shade200,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'http: 10.0.2.2:8000/media/store/prescriptions/mask_image.jpg'),
                  ),
                ),
              ),
              Expanded(
                  flex: 100,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          product.name!,
                          maxLines: 2,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        product.detail!,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      Text(
                        product.price! + r" $",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      
      ],
    );
  }
}
