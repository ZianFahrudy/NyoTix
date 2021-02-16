part of 'extensions.dart';

extension UserCredentialExtensions on UserCredential {
  UserModels convertToUser(
          {String name,
          int balance = 50000,
          List<String> selectedGenre = const [],
          String selectedLanguage = 'English',
          String profilePicture = ''}) =>
      UserModels(this.user.uid, this.user.email,
          name: name,
          selectedGenre: selectedGenre,
          balance: balance,
          selectedLanguage: selectedLanguage,
          profilePicture: profilePicture);

  Future<UserModels> fromFirestore() async =>
      await UserServices.getUsers(this.user.uid);
}


