class User {
  String userName;
  String password;

  User({required this.userName, required this.password});

  @override
  String toString() {
    return "($userName, ********)";
  }
}
