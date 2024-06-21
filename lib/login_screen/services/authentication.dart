import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthSevices {
  // for storign data in firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  // for authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

// for sign up
  Future<String> signUpUser({
    required String email,
    required String username,
    required String password,
  }) async {
    String res = 'Error some how';
    try {
      // for register user in firebase auth with email and password
      if (email.isNotEmpty & username.isNotEmpty & password.isNotEmpty) {
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        // for addin user to our cloud firestore
        await _firestore.collection("users").doc(credential.user!.uid).set({
          'name': username,
          'email': email,
          'uid': credential.user!.uid,
          // can't store user password in cloud firestore
        });
        res = 'success';
      } else {
        res = "Điền đầy đủ thông tin";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }
  // for login

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Error some how';
    try {
      if (email.isNotEmpty & password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Điền đầy đủ thông tin";
      }
    } catch (e) {
      return e.toString();
    }
    return res;
  }

  // for log out
  signOut() async {
    await _auth.signOut();
  }
}
