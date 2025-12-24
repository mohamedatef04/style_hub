import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  Future<String?> getIdToken() async {
    try {
      final GoogleSignInAccount? user = await _googleSignIn.signIn();

      if (user == null) {
        return null;
      }

      final GoogleSignInAuthentication auth = await user.authentication;
      return auth.idToken;
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
  }
}
