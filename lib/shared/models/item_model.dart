import 'package:b2b_mvp/shared/data/hive_types.dart';
import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: HiveTypes.itemTypeId)
class ItemModel {
  @HiveField(0)
  int cartId;
  @HiveField(1)
  int productId;

  ItemModel(this.cartId, this.productId);
}
