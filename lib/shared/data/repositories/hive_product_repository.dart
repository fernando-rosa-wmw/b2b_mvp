import 'dart:math';

import 'package:b2b_mvp/shared/interfaces/repositories/product_repository.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveProductRepository implements ProductRepository {
  late final Box box;
  static const boxName = 'HiveProductRepository';

  mock() async {
    var box = await Hive.openBox<ProductModel>(boxName);
    if (box.values.toList().isEmpty) {
      List<ProductModel> list = List<ProductModel>.generate(
          15,
          (index) => ProductModel(
              id: 'id',
              name: 'Trident $index',
              description: 'description',
              price: index + 10,
              imageUrl: 'https://cdn-icons-png.flaticon.com/512/2751/275107${Random.secure().nextInt(10)}.png'));
      await box.addAll(list);
    }
  }

  @override
  Future<bool> delete(int id) async {
    // await openBox();
    try {
      await box.delete(id);
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<List<ProductModel>> getAll() async {
    var box = await Hive.openBox<ProductModel>(boxName);
    try {
      List<ProductModel> products = box.values.toList() as List<ProductModel>;
      return products;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return [];
    }
  }

  @override
  Future<ProductModel> insert(ProductModel product) async {
    var box = await Hive.openBox<ProductModel>(boxName);
    try {
      box.add(product);
      return product;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return product;
    }
  }

  @override
  Future<List<ProductModel>> insertAll(List<ProductModel> productList) async {
    // await openBox();
    try {
      box.addAll(productList);
      return productList;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return productList;
    }
  }

  @override
  Future<ProductModel> update(ProductModel product) async {
    // await openBox();
    try {
      product.save();
      return product;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return product;
    }
  }
}
