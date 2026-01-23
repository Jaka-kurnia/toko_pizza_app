// Import entity MyUserEntity (representasi data untuk database)
import '../entities/entities.dart';

// Model MyUser
// Digunakan sebagai representasi data user di layer aplikasi
class MyUser {

  // ID user (biasanya UID dari Firebase)
  String userId;

  // Email user
  String email;

  // Nama user
  String name;

  // Penanda apakah user memiliki cart yang aktif
  bool hasActiveCart;

  // Constructor utama MyUser
  MyUser({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  // Object MyUser kosong
  // Digunakan saat user belum login
  static final empty = MyUser(
    userId: '',
    email: '',
    name: '',
    hasActiveCart: false,
  );

  // Mengubah MyUser (Model) menjadi MyUserEntity (untuk disimpan ke database)
  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  // Mengubah MyUserEntity (data dari database) menjadi MyUser (Model)
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      name: entity.name,
      hasActiveCart: entity.hasActiveCart,
    );
  }

  // Override toString untuk memudahkan debugging dan logging
  @override
  String toString() {
    return 'MyUser { userId: $userId, email: $email, name: $name, hasActiveCart: $hasActiveCart }';
  }
}
