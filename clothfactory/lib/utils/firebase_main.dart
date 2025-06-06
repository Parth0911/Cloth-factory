import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../authentication/model/logged_in_user_model.dart';
import 'firebase_constant.dart';

class FirebaseMain {
  final FirebaseAuth authInstance = FirebaseAuth.instance;

  Future<bool> googleLogin() async {
    bool isGoogleAuthSuccess = false;
    if (await _checkStatus()) {
      try {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential authCredential = GoogleAuthProvider.credential(
              idToken: googleSignInAuthentication.idToken,
              accessToken: googleSignInAuthentication.accessToken);
          UserCredential result =
              await authInstance.signInWithCredential(authCredential);
          LoginUsersModel loginUser = LoginUsersModel();
          loginUser.id = result.user?.uid ?? "";
          loginUser.name = result.user?.displayName ?? "";
          loginUser.email = result.user?.email ?? "";
          loginUser.profilePicture = result.user?.photoURL ?? "";
          loginUser.createdAt = DateTime.now().toString();

          CollectionReference users = FirebaseFirestore.instance
              .collection(FirebaseCollections.userCollection);
          users.doc(result.user?.uid).set(loginUser.toJson());
          // Getting users credential

          User? user = result.user;

          if (result != null) {
            return isGoogleAuthSuccess = true;
          } // if result not null we simply call the MaterialpageRoute,
          // for go to the HomePage screen
        }
      } catch (error) {
        print(error.toString());
        isGoogleAuthSuccess = false;
      }
    }

    return isGoogleAuthSuccess;
  }

  Future<bool> googleLogout() async {
    bool isGoogleAuthSuccess = false;
    if (await _checkStatus()) {
      try {
        await FirebaseAuth.instance.signOut();
        return isGoogleAuthSuccess = true;
      } catch (error) {
        isGoogleAuthSuccess = false;
      }
    } else {
      isGoogleAuthSuccess = false;
    }
    return isGoogleAuthSuccess;
  }

  Future<bool> _checkStatus() async {
    bool isOnline = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      isOnline = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isOnline = true;
      throw FirebaseCollections.noInternetString;
    }
    return isOnline;
  }
}
