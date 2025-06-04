import 'package:ecommerce_app/src/features/authentication/data/fake_auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreenController extends StateNotifier<AsyncValue<void>> {
  AccountScreenController({required this.authRepository})
      : super(const AsyncValue<void>.data(null));
  final FakeAuthRepository authRepository;

  Future<void> signOut() async {
    // set state to loading
    // sign out using auth repository
    // if success, set state to data
    // if error,set state to error
    // try {
    //   state = const AsyncValue<void>.loading();
    //   await authRepository.signOut();
    //   state = const AsyncValue<void>.data(null);
    //   return true;
    // } catch (e, st) {
    //   state = AsyncValue<void>.error(e, st);
    //   return false;
    // }

    //using guard
    state = const AsyncValue<void>.loading();
    state = await AsyncValue.guard(() => authRepository.signOut());
    //return state.hasError == false;
  }
}

final accountScreenControllerProvider = StateNotifierProvider.autoDispose<
    AccountScreenController, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AccountScreenController(authRepository: authRepository);
});
