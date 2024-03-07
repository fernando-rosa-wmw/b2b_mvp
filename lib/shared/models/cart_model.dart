import 'package:b2b_mvp/shared/data/hive_types.dart';
import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: HiveTypes.cartTypeId)
class CartModel {
  @HiveField(1)
  String cdEmpresa;
  @HiveField(2)
  String cdTipoPedido;
  @HiveField(3)
  String cdLocalEstoque;
  @HiveField(4)
  String cdProduto;
  @HiveField(5)
  String cdCliente;
  @HiveField(6)
  String cdUnidade;
  @HiveField(7)
  String cdTabelaPreco;
  @HiveField(8)
  String sessionId;
  @HiveField(9)
  String cdUsuario;
  @HiveField(10)
  double qtItem;
  @HiveField(11)
  DateTime dtCadastro;
  @HiveField(12)
  String hrCadastro;
  @HiveField(13)
  bool loadQuantidade;
  @HiveField(14)
  String flExcluido;
  @HiveField(15)
  String excludeSession;
  @HiveField(16)
  String originalSession;
  @HiveField(17)
  String flEmailEnviado;
  @HiveField(18)
  DateTime dtLimpeza;
  @HiveField(19)
  String cdGrupoCliente;

  // Estoque estoqueSelecionado;
  // TipoPedido tipoPedidoSelecionado;

  CartModel(
      this.cdEmpresa,
      this.cdTipoPedido,
      this.cdLocalEstoque,
      this.cdProduto,
      this.cdCliente,
      this.cdUnidade,
      this.cdTabelaPreco,
      this.sessionId,
      this.cdUsuario,
      this.qtItem,
      this.dtCadastro,
      this.hrCadastro,
      this.loadQuantidade,
      this.flExcluido,
      this.excludeSession,
      this.originalSession,
      this.flEmailEnviado,
      this.dtLimpeza,
      this.cdGrupoCliente);
}
