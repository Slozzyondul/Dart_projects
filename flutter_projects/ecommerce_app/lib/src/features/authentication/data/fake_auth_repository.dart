import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/utils/in_memory_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeAuthRepository {
  final _authState = InMemoryStore<AppUser?>(null);

  Stream<AppUser?> authStateChanges() => _authState.stream;
  AppUser? get currentUser => _authState.value;

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    // await Future.delayed(const Duration(seconds: 3));
    // throw Exception('something went wrong');
    if (currentUser == null) {
      _authState.value = AppUser(
        uid: email.split('').reversed.join(),
        email: email,
      );
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    if (currentUser == null) {
      _authState.value = AppUser(
        uid: email.split('').reversed.join(),
        email: email,
      );
    }
  }

  Future<void> signOut() async {
    // await Future.delayed(const Duration(seconds: 3));
    // throw Exception('something went wrong');
    _authState.value = null;
  }

  void dispose() => _authState.close();
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  final auth = FakeAuthRepository();
  ref.onDispose(() => auth.dispose());
  return auth;
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
