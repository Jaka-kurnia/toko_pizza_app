import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_repository/src/user_repo.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final userCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;
  
  @override
  Future<void> setUserData(myUser) {
    // TODO: implement setUserData
    throw UnimplementedError();
  }
  
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
  
  @override
  signUp(myUser, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  @override
  Future<void> signin(String email, String password) {
    // TODO: implement signin
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement user
  get user => throw UnimplementedError();
}