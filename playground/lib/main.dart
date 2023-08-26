import 'package:flutter/material.dart';

import 'package:asp/asp.dart';

import 'package:playground_app/src/core/module.dart';
import 'package:playground_app/src/core/restClient/rest_client.dart';
import 'package:playground_app/src/features/cities/city_reducer.dart';
import 'package:playground_app/src/features/cities/repositories/city_repository.dart';
import 'package:playground_app/src/features/cities/repositories/city_repository_impl.dart';
import 'package:playground_app/src/features/cities/services/city_service.dart';
import 'package:playground_app/src/features/cities/services/city_service_impl.dart';
import 'package:playground_app/src/features/products/product_reducer.dart';
import 'package:playground_app/src/features/products/repositories/product_repository.dart';
import 'package:playground_app/src/features/products/repositories/product_repository_impl.dart';
import 'package:playground_app/src/features/products/services/product_service.dart';
import 'package:playground_app/src/features/products/services/product_service_impl.dart';
import 'package:playground_app/src/playground_app.dart';

void main() {
  injector.add(RestClient.new);
  injector.add<ProductRepository>(ProductRepositoryImpl.new);
  injector.add<ProductService>(ProductServiceImpl.new);
  injector.addSingleton(ProductReducer.new);

  injector.add<CityRepository>(CityRepositoryImpl.new);
  injector.add<CityService>(CityServiceImpl.new);
  injector.addSingleton(CityReducer.new);

  injector.commit();

  runApp(const RxRoot(child: PlaygroundApp()));
}
