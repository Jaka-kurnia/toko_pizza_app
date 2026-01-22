// Import library developer untuk fungsi log()
import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

// Import Firebase Firestore
import 'package:cloud_firestore/cloud_firestore.dart';

// Import Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';

// Import entity user (untuk mapping data Firestore)
import 'package:user_repository/src/entities/entities.dart';

// Import model user (representasi data di aplikasi)
import 'package:user_repository/src/models/models.dart';

// Import abstract class UserRepository
import 'package:user_repository/src/user_repo.dart';

// Implementasi UserRepository menggunakan Firebase
class FirebaseUserRepo implements UserRepository {

  // Instance FirebaseAuth
  final FirebaseAuth _firebaseAuth;

  // Referensi collection "users" di Firestore
  final userCollection = FirebaseFirestore.instance.collection('users');

  // Constructor, jika firebaseAuth tidak dikirim maka pakai FirebaseAuth.instance
  FirebaseUserRepo({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  // Stream untuk memantau perubahan status autentikasi user
  @override
  Stream<MyUser> get user {
    // authStateChanges() akan terpanggil setiap login / logout
    return _firebaseAuth.authStateChanges().asyncMap((user) async {

      // Jika user belum login
      if (user == null) {
        return MyUser.empty;
      } else {
        // Ambil data user dari Firestore berdasarkan uid
        final value = await userCollection.doc(user.uid).get();

        // Convert data Firestore → Entity → Model
        return MyUser.fromEntity(
          MyUserEntity.fromDocument(value.data()!),
        );
      }
    });
  }

  // Method untuk registrasi user baru
  @override
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      // Membuat akun baru menggunakan email & password
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: myUser.email,
        password: password,
      );

      // Simpan UID Firebase ke dalam model MyUser
      myUser.userId = userCredential.user!.uid;

      // Kembalikan data user
      return myUser;
    } catch (e) {
      // Log error jika terjadi kegagalan
      log(e.toString());
      rethrow;
    }
  }

  // Method login user
  @override
  Future<void> signin(String email, String password) async {
    try {
      // Login menggunakan email dan password
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      // Log error login
      log(e.toString());
      rethrow;
    }
  }

  // Method logout user (belum diimplementasikan)
  @override
  Future<void> logOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  // Menyimpan data user ke Firestore
  @override
  Future<void> setUserData(MyUser myUser) async {
    try {
      // Simpan data user ke collection "users" dengan document ID = userId
      await userCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      // Log error jika gagal menyimpan data
      log(e.toString());
      rethrow;
    }
  }
}
