String? passwordValidator(String? value) {
  if (value == null) return "Password may not be null";
  if (value.length < 6) return "Password should be over 6 chars long";

  return null;
}
