// Entity MyUserEntity
// Digunakan sebagai representasi data user untuk penyimpanan database (Firestore)
class MyUserEntity {

  // ID user (UID dari Firebase)
  String userId;

  // Email user
  String email;

  // Nama user
  String name;

  // Status apakah user memiliki cart yang aktif
  bool hasActiveCart;

  // Constructor utama MyUserEntity
  MyUserEntity({
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  // Mengubah MyUserEntity menjadi Map
  // Digunakan saat menyimpan data ke Firestore
  Map<String, Object?> toDocument() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'hasActiveCart': hasActiveCart,
    };
  }

  // Membuat MyUserEntity dari data Firestore (Map)
  // Digunakan saat mengambil data dari database
  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      hasActiveCart: doc['hasActiveCart'],
    );
  }
}
