import 'package:b2b_mvp/shared/interfaces/repositories/cart_repository.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveCartRepository implements CartRepository {
  static const boxName = 'HiveCartRepository';

  _getBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<CartModel>(boxName);
    }
  }

  @override
  Future<bool> delete(int id) async {
    var box = await _getBox();
    try {
      await box.delete(id);
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return false;
    }
  }

  @override
  Future<List<CartModel>> getAll() async {
    var box = await _getBox();
    try {
      List<CartModel> products = box.values.toList() as List<CartModel>;
      return products;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return [];
    }
  }

  @override
  Future<CartModel> insert(CartModel product) async {
    var box = await _getBox();
    try {
      box.add(product);
      return product;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return product;
    }
  }

  @override
  Future<List<CartModel>> insertAll(List<CartModel> productList) async {
    var box = await _getBox();
    try {
      box.addAll(productList);
      return productList;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return productList;
    }
  }

  @override
  Future<CartModel> update(CartModel product) async {
    await _getBox();
    try {
      product.save();
      return product;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      return product;
    }
  }

  @override
  Future<bool> addProducts(List<ProductModel> products, CartModel cardModel) async {
    await _getBox();
    try {
      cardModel.productList!.addAll(products);
      Logger().i('addProductsRepo ${cardModel.toString()}');
      cardModel.save();
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      throw Exception(e);
    }
  }

  @override
  Future<CartModel> getOne() async {
    var box = await Hive.openBox<CartModel>(boxName);
    var productBox = await Hive.openBox<ProductModel>('HiveProductRepository');
    CartModel? cart = box.values.lastOrNull;

    if (cart == null) {
      cart = CartModel(
          id: 'id',
          name: 'generated',
          quantity: 0,
          price: 0,
          productList: HiveList(productBox));
      box.add(cart);
      box.flush();
    }
    return cart;
  }
}
