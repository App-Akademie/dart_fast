class UserData {
  String userName;
  String password;

  UserData({required this.userName, required this.password});

  @override
  String toString() {
    return "($userName, ********)";
  }
}
