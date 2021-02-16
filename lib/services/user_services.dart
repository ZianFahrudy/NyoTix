part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUsers(UserModels userModels) async {
    await _userCollection.doc(userModels.id).set({
      'email': userModels.email,
      'name': userModels.name,
      'selectedGenre': userModels.selectedGenre,
      'selectedLanguage': userModels.selectedLanguage,
      'balance': userModels.balance,
      'profilePicture': userModels.profilePicture
    });
  }

  static Future<UserModels> getUsers(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return UserModels(id, snapshot.data()['email'],
        balance: snapshot.data()['balance'],
        name: snapshot.data()['name'],
        profilePicture: snapshot.data()['profilePicture'],
        selectedGenre: (snapshot.data()['selectedGenre'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.data()['selectedLanguage']);
  }
}
