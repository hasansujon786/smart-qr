import 'package:hive/hive.dart';

part 'person.g.dart';
const String hiveBoxPersons = 'persons';

@HiveType(typeId: 0)
class Person {
  Person({
    required this.name,
    required this.age,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int age;
}
