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
    } else {
      return Hive.box<CartModel>(boxName);
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

  @override
  Future<bool> addProduct(ProductModel product, CartModel cardModel) async {
    await _getBox();
    try {
      if (contains(cardModel, product)) {
        cardModel.productList!.firstWhere((element) => element.key == product.key).quantity += 1;
      } else {
        product.quantity += 1;
        cardModel.productList!.add(product);
      }

      Logger().i('addProductsRepo ${cardModel.toString()}');
      cardModel.save();
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      throw Exception(e);
    }
  }

  bool contains(CartModel cardModel, ProductModel product) {
    bool contains = false;
    for (ProductModel productModel in cardModel.productList!) {
      if (productModel.key == product.key) {
        contains = true;
      }
    }
    return contains;
  }

  @override
  Future<bool> removeProduct(ProductModel product, CartModel cardModel) async {
    final Box box = await _getBox();
    try {
      if (contains(cardModel, product)) {
        cardModel.productList!.firstWhere((element) => element.key == product.key).quantity -= 1;
        cardModel.save();
        box.flush();
      }

      if (cardModel.productList!.firstWhere((element) => element.key == product.key).quantity == 0) {
        cardModel.productList!.remove(product);
        box.flush();
      }

      Logger().i('RemoveProductsRepo ${cardModel.toString()}');
      cardModel.save();
      box.flush();
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      throw Exception(e);
    }
  }

  @override
  Future<bool> removeAllProducts(ProductModel product, CartModel cardModel) async {
    await _getBox();
    try {
      product.quantity = 0;
      cardModel.productList!.remove(product);

      Logger().i('RemoveProductsRepo ${cardModel.toString()}');
      cardModel.save();
      return true;
    } catch (e, s) {
      Logger().e(e, stackTrace: s);
      throw Exception(e);
    }
  }
}
