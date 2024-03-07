import 'package:b2b_mvp/shared/models/auth_model.dart';
import 'package:b2b_mvp/shared/models/cart_model.dart';
import 'package:b2b_mvp/shared/models/item_model.dart';
import 'package:b2b_mvp/shared/models/product_model.dart';
import 'package:b2b_mvp/shared/models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class HiveInit {
  static initHive() async {
    final List<TypeAdapter> typeAdapters = [
      AuthModelAdapter(),
      CartModelAdapter(),
      ItemModelAdapter(),
      ProductModelAdapter(),
      UserModelAdapter(),
    ];

    Hive.registerAdapter(AuthModelAdapter());
    Hive.registerAdapter(CartModelAdapter());
    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(ProductModelAdapter());
    Hive.registerAdapter(UserModelAdapter());
  }

  static void _registerAdapter(TypeAdapter typeAdapter) {
    if (!Hive.isAdapterRegistered(typeAdapter.typeId)) {
      Hive.registerAdapter(typeAdapter);
      Logger().d('adapter registered ${typeAdapter.typeId}');
    } else {
      Logger().d('adapter already registered ${typeAdapter.typeId}');
    }
  }
}
