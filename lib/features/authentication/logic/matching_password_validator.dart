/// Wenn Benutzername frei und Passwörter gleich, kann man den Benutzer registrieren.
/// -> Solche Logik sollte _eigentlich_ im Backend gemacht sein, aber Firebase
/// hat Cloud Functions nur in dem Plan mit Risiko auf Zahlung.
String? matchingPasswordValidator(String? password1, String? password2) {
  const int minPasswordLength = 6;
  if (password1 == null || password2 == null) return "Password may not be null";
  if (password1.length < minPasswordLength ||
      password2.length < minPasswordLength) {
    return "Password should be over 6 chars long";
  }
  if (password1 != password2) return "Passwords do not match";

  return null;
}
