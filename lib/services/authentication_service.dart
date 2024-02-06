import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String url = "https://areis.page.link/verify";
  final String androidPackageName = "com.areis.areis";
  User? user;

  Future sendAuthEmail(String userEmail) async {
    final userEmail0 = userEmail;
    try {
      await _auth.sendSignInLinkToEmail(
          email: userEmail0,
          actionCodeSettings: ActionCodeSettings(
              url: url,
              androidPackageName: androidPackageName,
              androidMinimumVersion: "1",
              handleCodeInApp: true));

      FirebaseDynamicLinks.instance.onLink.listen((pendingDynamicData) {
        completeAuthentication(userEmail0, pendingDynamicData.link);
      });
    } catch (e) {
      print(e);
    }
  }

  void handleInitialAuthenticationLink() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      if (_auth.isSignInWithEmailLink(initialLink.toString())) {
        String email = getEmailFromLink(initialLink.toString())!;

        completeAuthentication(email, initialLink.link);
      }
    }
  }

  String? getEmailFromLink(String link) {
    // Regular expression pattern to extract email from the link
    final RegExp emailRegex = RegExp(r"(?<=email=)[^&]+");

    // Find the first match of the email pattern in the link
    final Match? match = emailRegex.firstMatch(link);

    if (match != null) {
      // Extract and return the email
      return match.group(0);
    } else {
      // No email found in the link
      return null;
    }
  }

  void completeAuthentication(String email, Uri link) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailLink(
              email: email,
              emailLink: link
                  .toString() // Replace 'link' with the authentication link received
              );

      User? user = userCredential.user;

      if (user != null) {
        // Authentication successful
        // You can perform additional actions or navigate to a new screen
        print('Authentication successful. User: ${user.uid}');
      } else {
        // Authentication failed
        print('Authentication failed.');
      }
    } catch (e) {
      // Error occurred during authentication
      print('Error completing authentication: $e');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void signOut() async {
    await _auth.signOut();
  }
}
