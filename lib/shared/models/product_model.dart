import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 22)
class ProductModel extends HiveObject {
  @HiveField(0)
  String cdEmpresa;
  @HiveField(1)
  String cdProduto;
  @HiveField(2)
  String dsProduto;
  @HiveField(3)
  String nuCdBarras;
  @HiveField(4)
  String dsFichaTecnica;
  @HiveField(5)
  String cdDepartamento;
  @HiveField(6)
  String cdMarca;
  @HiveField(7)
  String flBrinde;
  @HiveField(8)
  String flPesavel;
  @HiveField(9)
  double vlPctIpi;
  @HiveField(10)
  double vlMinIpi;
  @HiveField(11)
  String flBloqueado;
  @HiveField(12)
  String flUsaStandout;
  @HiveField(13)
  int nuFracao;
  @HiveField(14)
  String cdUnidadeBase;
  @HiveField(15)
  String cdUnidadeFracao;
  @HiveField(16)
  String flRestrito;
  @HiveField(17)
  String qtEstoqueAlerta;
  @HiveField(18)
  String flUsaUnidadeBaseDsFracao;
  @HiveField(19)
  String flPermiteConsig;
  @HiveField(20)
  String urlFoto;
  @HiveField(21)
  String urlFotoMiniatura;
  @HiveField(22)
  String cdProdutoStatus;
  @HiveField(23)
  double qtPeso;

  ProductModel(
      this.cdEmpresa,
      this.cdProduto,
      this.dsProduto,
      this.nuCdBarras,
      this.dsFichaTecnica,
      this.cdDepartamento,
      this.cdMarca,
      this.flBrinde,
      this.flPesavel,
      this.vlPctIpi,
      this.vlMinIpi,
      this.flBloqueado,
      this.flUsaStandout,
      this.nuFracao,
      this.cdUnidadeBase,
      this.cdUnidadeFracao,
      this.flRestrito,
      this.qtEstoqueAlerta,
      this.flUsaUnidadeBaseDsFracao,
      this.flPermiteConsig,
      this.urlFoto,
      this.urlFotoMiniatura,
      this.cdProdutoStatus,
      this.qtPeso);

// private List<ReferenciaProduto> referenciaProdutoList;
}
