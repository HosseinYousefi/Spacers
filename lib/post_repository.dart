import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  return Color.fromRGBO(
    Random().nextInt(255),
    Random().nextInt(255),
    Random().nextInt(255),
    1.0,
  );
}

class Post {
  int id;
  Color color;

  Post(this.id, this.color);
}

abstract class PostRepository {
  Future<List<Post>> getAllPosts();
  Stream<List<Post>> watchAllPosts();
  Future<bool> like(int id);
  Future<bool> unlike(int id);
}

class MockPostRepository implements PostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    await Future.delayed(Duration(seconds: 0));
    return [
      Post(1, Colors.red),
      Post(2, Colors.blue),
      Post(3, Colors.green),
      Post(4, Colors.yellow),
      Post(5, Colors.pink),
    ];
  }

  @override
  Future<bool> like(int id) async {
    return true;
  }

  @override
  Future<bool> unlike(int id) async {
    return false;
  }

  @override
  Stream<List<Post>> watchAllPosts() async* {
    var posts = <Post>[];
    while (true) {
      await Future.delayed(Duration(seconds: 5));
      posts.add(Post(posts.length, randomColor()));
      yield posts;
    }
  }
}
