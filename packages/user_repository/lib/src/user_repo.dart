// Import model MyUser
import 'models/models.dart';

// Abstract class sebagai kontrak repository user
// Semua implementasi (Firebase, API, dll) WAJIB mengikuti ini
abstract class UserRepository {

  // Stream yang mengirimkan data user saat status auth berubah
  // Digunakan untuk memantau login / logout secara real-time
  Stream<MyUser> get user;

  // Method untuk mendaftarkan user baru
  // Mengembalikan data MyUser setelah berhasil sign up
  Future<MyUser> signUp(MyUser myUser, String password);

  // Method untuk menyimpan data user ke database (misalnya Firestore)
  Future<void> setUserData(MyUser myUser);

  // Method untuk login menggunakan email dan password
  Future<void> signin(String email, String password);

  // Method untuk logout user dari aplikasi
  Future<void> logOut();
}
