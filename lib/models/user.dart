class Userscreen {
  final String uid;
  Userscreen({required this.uid});
}

class UserData {
  late final String uid;
  late final String name;
  late final String sugare;
  late final int strenth;
  UserData(
      {required this.name,
      required this.strenth,
      required this.sugare,
      required this.uid});
}
