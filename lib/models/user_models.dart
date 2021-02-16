part of 'models.dart';

class UserModels extends Equatable {
  final String id;
  final String name;
  final String email;
  final List<String> selectedGenre;
  final String selectedLanguage;
  final int balance;
  final String profilePicture;

  UserModels(this.id, this.email,
      {this.name,
      this.selectedGenre,
      this.balance = 50000,
      this.selectedLanguage,
      this.profilePicture = ''});

  UserModels copyWith({String name, String profilePicture, int balance}) =>
      UserModels(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          balance: balance ?? this.balance,
          selectedGenre: selectedGenre,
          selectedLanguage: selectedLanguage);

  @override
  String toString() {
    return '$id - $email - $name';
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        selectedGenre,
        balance,
        selectedGenre,
        selectedLanguage,
        profilePicture
      ];
}
