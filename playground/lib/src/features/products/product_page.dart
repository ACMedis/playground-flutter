import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:playground_app/src/core/ui/helpers/messages.dart';
import 'package:playground_app/src/core/ui/widgets/playground_button.dart';
import 'package:playground_app/src/core/ui/widgets/playground_empty.dart';
import 'package:playground_app/src/features/products/product_store.dart';
import 'package:playground_app/src/features/products/widgets/product_tile.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    super.initState();
    final store = Modular.get<ProductStore>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _reactionDisposer = reaction(
        (_) => store.state,
        (state) {
          if (state.errorMessage.isNotEmpty) {
            Messages.showError(state.errorMessage, context);
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _reactionDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<ProductStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista produtos'),
      ),
      body: Observer(
        builder: (_) {
          final state = store.state;
          final productsLength = state.products.length;
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaygroundButton(
                  onPressed: () {
                    store.fetchProducts();
                  },
                  label: 'Pesquisar',
                  isLoading: (state.isLoading),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Visibility(
                    visible: (productsLength == 0),
                    replacement: ListView.builder(
                      itemCount: productsLength,
                      itemBuilder: (_, index) {
                        final product = state.products[index];
                        return ProductTile(product: product);
                      },
                    ),
                    child: const PlaygroundEmpty(
                      imagePath: 'assets/images/empty.png',
                      message: 'Nenhum produto encontrado!',
                    ),
                  ),
                ),
                Offstage(
                  offstage: (productsLength == 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Center(
                          child: Text(
                        'Total produtos: ${state.products.length}',
                        style: const TextStyle(fontSize: 16),
                      )),
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
