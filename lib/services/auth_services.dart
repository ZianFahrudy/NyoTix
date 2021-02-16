part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenre, String selectedLanguage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModels userModels = userCredential.convertToUser(
        name: name,
        selectedGenre: selectedGenre,
        selectedLanguage: selectedLanguage,
      );

      await UserServices.updateUsers(userModels);

      return SignInSignUpResult(userModels: userModels);
    } catch (e) {
      return SignInSignUpResult(message: e.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModels userModels = await userCredential.fromFirestore();

      return SignInSignUpResult(userModels: userModels);
    } catch (e) {
      String message;

      if (Platform.isAndroid) {
        switch (e.message) {
          case "There is no user record corresponding to this identifier. The user may have been deleted.":
            message = "Akun tidak terdaftar. Akun ini mungkin telah dihapus";
            break;
          case "The password is invalid or the user does not have a password.":
            message =
                "Kata sandi tidak valid atau pengguna tidak memiliki kata sandi";
            break;
          case "A network error (such as timeout, interrupted connection or unreachable host) has occurred.":
            message =
                "Terjadi kesalahan jaringan. Periksa koneksi internet antum";
            break;
          default:
            print("Error ${e.message} belum terdaftar");
        }
      }

      return SignInSignUpResult(message: message.toString());
    }
  }

  static Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  String message;
  UserModels userModels;

  SignInSignUpResult({this.message, this.userModels});
}
