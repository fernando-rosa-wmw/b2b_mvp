
import 'package:intl/intl.dart';

String formatCurrency(int value) {
  final oCcy = NumberFormat("#,##0.00", "pt_BR");
  return "R\$ ${oCcy.format(value)}";
}
