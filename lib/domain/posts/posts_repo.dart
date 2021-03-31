import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/infrastructure/db/firestore.dart';

import 'post.dart';

class PostsRepo {
  final FirebaseFirestore firestore;

  PostsRepo(this.firestore);

  Future<void> post(
    String authorName,
    String authorId,
    String content,
    DateTime createdAt,
  ) {
    return firestore.collection('posts').add({
      'author_name': authorName,
      'author_id': authorId,
      'content': content,
      'created_at': createdAt.toIso8601String(),
    });
  }

  Stream<List<Post>> watchPosts() {
    return firestore
        .collection('posts')
        .orderBy('created_at', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Post(
                  id: doc.id,
                  authorName: doc['author_name'],
                  content: doc['content'],
                ))
            .toList());
  }
}

final postsRepoProvider = Provider<PostsRepo>((ref) {
  final firestore = ref.watch(firestoreProvider);
  return PostsRepo(firestore);
});
