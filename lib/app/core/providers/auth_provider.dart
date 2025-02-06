import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class AuthProvider with ChangeNotifier {
  final logger = Logger();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  bool _isLoading = true;

  AuthProvider() {
    _auth.authStateChanges().listen(_onAuthStateChanged);
  }

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      logger.e(e);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _auth.signOut();
    } catch (e) {
      logger.e(e);
    } finally {
      _setLoading(false);
    }
  }

  void _onAuthStateChanged(User? user) {
    _user = user;
    _setLoading(false);
  }

  Future<void> signInWithGoogle() async {
    _setLoading(true);
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } catch (e) {
      logger.e(e);
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
