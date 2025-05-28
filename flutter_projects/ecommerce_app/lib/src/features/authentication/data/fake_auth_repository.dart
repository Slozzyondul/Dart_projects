import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() {
    //TODO: Implement
    throw UnimplementedError();
  }

  @override
  AppUser? get currentUser => null; //TODO: Implement
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    //TODO: Implement
  }
  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    //TODO: Implement
  }
  @override
  Future<void> signOut() async {
    //TODO: Implement
  }
}

class FakeAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null); //TODO: Implement
  @override
  AppUser? get currentUser => null; //TODO: Implement
  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    //TODO: Implement
  }
  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    //TODO: Implement
  }
  @override
  Future<void> signOut() async {
    //TODO: Implement
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
