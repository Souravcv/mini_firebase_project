import 'package:fire_stor/models/user.dart';
import 'package:fire_stor/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServica {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userscreen? _userfromfiebase(User? user) {
    return user != null ? Userscreen(uid: user.uid) : null;
  }

  Stream<Userscreen?> get user {
    return _auth
        .authStateChanges()
        .map(((User? user) => _userfromfiebase(user)));
    // Stream<User?> get user {
    //   return _auth.authStateChanges()
    //     .map(_userfromfiebase);
    // }
  }

  Future signInAuth() async {
    try {
      UserCredential reselt = await _auth.signInAnonymously();
      User? users = reselt.user;
      return _userfromfiebase(users);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String passworde) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: passworde);
      User? user = result.user;
      return _userfromfiebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String passworde) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: passworde);
      User? user = result.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData('0', 'new crew member', 100);
      return _userfromfiebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future sineOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
