import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/auth_repository.dart';

Color randomColor() {
  return Color.fromRGBO(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    1.0,
  );
}

enum LikeStatus {
  liked,
  disliked,
  none,
}

class Post {
  int id;
  Color color;
  LikeStatus likeStatus;

  Post({
    required this.id,
    required this.color,
    this.likeStatus = LikeStatus.none,
  });
}

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
  Stream<List<Post>> watchAllPosts();
  Future<bool> like(int id);
  Future<bool> dislike(int id);
}

class MockPostRepository implements PostRepository {
  final AuthRepository authRepository;

  MockPostRepository({required this.authRepository});

  final posts = <Post>[];

  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(Duration(seconds: 0));
    return posts;
  }

  @override
  Future<bool> like(int id) async {
    posts[id].likeStatus = LikeStatus.liked;
    return true;
  }

  @override
  Future<bool> dislike(int id) async {
    posts[id].likeStatus = LikeStatus.disliked;
    return true;
  }

  @override
  Stream<List<Post>> watchAllPosts() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 5));
      posts.add(Post(id: posts.length, color: randomColor()));
      yield posts;
    }
  }
}

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return MockPostRepository(authRepository: authRepository);
});
