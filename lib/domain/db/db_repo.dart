import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/infrastructure/db/firestore.dart';

class DBRepo {
  final FirebaseFirestore firestore;

  DBRepo(this.firestore);

  Future<String?> getName(String uid) async {
    final document = await firestore.collection('users').doc(uid).get();
    if (document.exists) {
      print(document.data());
      return document.data()!['Name'];
    }
  }

  Stream<String?> watchName(String uid) {
    return firestore
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => event.data()!['Name'] as String?);
  }
}

final dbRepoProvider = Provider<DBRepo>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return DBRepo(firestore);
});
