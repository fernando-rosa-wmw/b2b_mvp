import 'package:b2b_mvp/shared/data/hive_types.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: HiveTypes.userTypeId)
class UserModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });
}
