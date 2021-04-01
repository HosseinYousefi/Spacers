import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../infrastructure/auth/firebase_auth_service.dart';
import '../../infrastructure/db/firestore.dart';
import 'auth_failure.dart';
import 'user.dart';

extension FirestoreX on firebase_auth.User {
  String get name => displayName ?? '';
}

class AuthRepo {
  final firebase_auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  final StreamController<String> controller;

  AuthRepo(this.firebaseAuth, this.firestore) : controller = StreamController();

  void nameAdded(String name) {
    controller.add(name);
  }

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
      return right(User(id: firebaseUser.uid, name: firebaseUser.name));
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
      return right(User(id: firebaseUser.uid, name: firebaseUser.name));
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
    return Rx.merge([
      firebaseAuth.authStateChanges().map(
          (user) => user == null ? null : User(id: user.uid, name: user.name)),
      controller.stream.map(
        (event) => firebaseAuth.currentUser == null
            ? null
            : User(
                id: firebaseAuth.currentUser!.uid,
                name: firebaseAuth.currentUser!.displayName ?? event,
              ),
      ),
    ]);
  }
}

final authRepoProvider = Provider<AuthRepo>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  final firestore = ref.watch(firestoreProvider);
  return AuthRepo(firebaseAuth, firestore);
});
