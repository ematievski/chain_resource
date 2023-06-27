import 'package:hive/hive.dart';

part 'chain.g.dart';

@HiveType(typeId: 1)
class Chain {
  @HiveField(0)
  String name;
  Chain({
    required this.name,
  });
}
