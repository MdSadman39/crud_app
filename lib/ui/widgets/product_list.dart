import 'package:flutter/material.dart';

import '../models/products.dart';
import '../screens/update_product._screen.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //leading: Image.network(  product.img ?? '' ),
      title: Text(product.productName ?? ' '),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${product.productCode ?? ''}'),
          Text('Quantity: ${product.qty ?? ''}'),
          Text('Price: \$${product.unitPrice ?? ''}'),
          Text('Total Price: \$${product.totalPrice ?? ''}'),
        ],
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, UpdateProductScreen.name);
            },
            icon: Icon(Icons.edit),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
