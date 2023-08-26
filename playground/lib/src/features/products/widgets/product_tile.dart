import 'package:flutter/material.dart';

import 'package:playground_app/src/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Código: ${product.codeErp}'),
          const SizedBox(height: 6),
          Text(product.description),
          const SizedBox(height: 3),
          const Divider(),
        ],
      ),
    );
  }
}
