import 'package:flutter/material.dart';

import 'package:asp/asp.dart';

import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/features/products/product_atom.dart';
import 'package:playground_app/src/features/products/widgets/product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late final RxDisposer _errorListeners;

  @override
  void initState() {
    super.initState();
    _errorListeners = rxObserver(
      () => errorState.value,
      filter: () => errorState.value.isNotEmpty,
      effect: (value) => Messages.showError(errorState.value, context),
    );
  }

  @override
  void dispose() {
    _errorListeners();
    clearProductsAction();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final (products, errorMessage) = context.select(
      () => (productsState.value, errorState.value),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista produtos'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Error: $errorMessage'),
            ElevatedButton(
              onPressed: () {
                fetchProductsAction.call();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(56),
              ),
              child: const Text('Pesquisar'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  final product = products[index];
                  return ProductTile(product: product);
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
                child: Center(
                    child: Text(
                  'Total produtos: ${products.length}',
                  style: const TextStyle(fontSize: 16),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
