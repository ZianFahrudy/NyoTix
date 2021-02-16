part of 'models.dart';

class RegistrationData {
  String email;
  String name;
  String password;
  List<String> selectedGenre;
  String selectedLanguage;
  File profilePicture;

  RegistrationData(
      {this.name = '',
      this.email = '',
      this.selectedGenre = const [],
      this.selectedLanguage = '', this.password,
      this.profilePicture});
}
