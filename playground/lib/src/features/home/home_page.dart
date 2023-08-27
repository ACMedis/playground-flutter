import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/product');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text('PRODUTOS'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/city');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text('CIDADES'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/customer/add');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(56),
                ),
                child: const Text('Novo Cliente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
