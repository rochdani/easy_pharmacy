import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginapp/models/User.dart';
import 'package:loginapp/models/profile.dart';
import 'package:loginapp/services/database.dart';
import 'package:loginapp/services/firestore_services.dart';

class AuthService {
  //sign in anno
  //final means it can not change
  //_auth means _ means private and it can not be access out side this file
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = FirestoreService();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Profile _currentUser;
  Profile get currentUser => _currentUser;
  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  Future signInAnoun() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign up with email and password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//register with email and password
  Future registerWithEmailAndPassword(
      String email, String name, String password, String userType) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      //create new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData(name, email, userType, user.uid);
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _auth.currentUser();
    return user != null;
  }

  Future _populateCurrentUser(FirebaseUser user) async {
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
    }
  }
}
