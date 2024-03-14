import 'package:b2b_mvp/shared/data/hive_types.dart';
import 'package:b2b_mvp/shared/format.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'product_model.g.dart';
@HiveType(typeId: HiveTypes.productTypeId)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final int price;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  int quantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.quantity = 0,
  });

  String get formattedPrice {
    return formatCurrency(price);
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, description: $description, price: $price, imageUrl: $imageUrl, quantity: $quantity}';
  }

// ProductModel(
//     this.cdEmpresa,
//     this.cdProduto,
//     this.dsProduto,
//     this.nuCdBarras,
//     this.dsFichaTecnica,
//     this.cdDepartamento,
//     this.cdMarca,
//     this.flBrinde,
//     this.flPesavel,
//     this.vlPctIpi,
//     this.vlMinIpi,
//     this.flBloqueado,
//     this.flUsaStandout,
//     this.nuFracao,
//     this.cdUnidadeBase,
//     this.cdUnidadeFracao,
//     this.flRestrito,
//     this.qtEstoqueAlerta,
//     this.flUsaUnidadeBaseDsFracao,
//     this.flPermiteConsig,
//     this.urlFoto,
//     this.urlFotoMiniatura,
//     this.cdProdutoStatus,
//     this.qtPeso);
}
