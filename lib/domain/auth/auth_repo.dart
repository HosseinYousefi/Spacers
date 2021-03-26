import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/domain/auth/auth_failure.dart';
import 'package:hs_app/infrastructure/auth/firebase_auth_service.dart';

import 'user.dart';

class AuthRepo {
  final firebase_auth.FirebaseAuth firebaseAuth;

  AuthRepo(this.firebaseAuth);

  Future<Either<AuthFailure, User>> register(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return left(GeneralAuthFailure());
      }
      return right(User(id: firebaseUser.uid));
    } catch (e) {
      print(e);
      return left(GeneralAuthFailure());
    }
  }

  Future<Either<AuthFailure, User>> login(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      final firebaseUser = userCredential.user;
      if (firebaseUser == null) {
        return left(GeneralAuthFailure());
      }
      return right(User(id: firebaseUser.uid));
    } catch (e) {
      print(e);
      return left(GeneralAuthFailure());
    }
  }

  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await firebaseAuth.signOut();
      return right(unit);
    } catch (_) {
      return left(GeneralAuthFailure());
    }
  }

  Stream<User?> authStateChanges() {
    return firebaseAuth
        .authStateChanges()
        .map((user) => user == null ? null : User(id: user.uid));
  }
}

final authRepoProvider = Provider<AuthRepo>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return AuthRepo(firebaseAuth);
});
