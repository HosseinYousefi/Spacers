import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/domain/auth/auth_repo.dart';
import 'package:hs_app/infrastructure/auth/firebase_auth_service.dart';
import 'package:hs_app/infrastructure/db/firestore.dart';

class UsernameRepo {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;

  UsernameRepo(this._firestore, this._firebaseAuth);

  Future<bool> isAvailable(String username) async {
    if (username == '') return false;
    return !(await _firestore.collection('usernames').doc(username).get())
        .exists;
  }

  Future<bool> changeUsername(String username) async {
    print('hey');
    try {
      final doc = await _firestore.collection('usernames').doc(username).get();
      if (doc.exists) {
        return false;
      }
      final user = _firebaseAuth.currentUser;
      if (user == null) {
        return false;
      }
      print(user.uid);
      await _firestore
          .collection('users')
          .doc(user.uid)
          .set({'username': username}, SetOptions(merge: true));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}

final usernameRepoProvider = Provider<UsernameRepo>((ref) {
  final firestore = ref.watch(firestoreProvider);
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return UsernameRepo(firestore, firebaseAuth);
});
