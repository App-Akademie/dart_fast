// Inspired by https://stackoverflow.com/a/50663835
String? emailValidator(String? value) {
  if (value == null) return "Email somehow null";
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value)) {
    return null;
  } else {
    return "Your email doesn't seem to be right";
  }
}
