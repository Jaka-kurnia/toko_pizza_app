library user_repository;

// Export Models dan Entities agar bisa digunakan oleh project utama (UI/Bloc)
export 'src/entities/entities.dart';
export 'src/models/models.dart';

// Export Interface/Abstract Class
export 'src/user_repo.dart';

// Export Implementasi (Hanya jika kamu ingin FirebaseUserRepository bisa diakses langsung)
export 'src/firebase_user_repo.dart';