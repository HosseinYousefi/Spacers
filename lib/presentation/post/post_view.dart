import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/posts/posts_bloc.dart';
import 'package:yeet/yeet.dart';

class PostView extends HookWidget {
  final String id;

  PostView(this.id);

  @override
  Widget build(BuildContext context) {
    final postsState = useProvider(postsBlocProvider.state);
    final post = postsState.posts.firstWhere((p) => p.id == id);
    return GestureDetector(
      onTap: context.yeet,
      child: Container(
        color: Colors.black.withOpacity(0.3),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: GestureDetector(
            onTap: () {},
            child: Hero(
              tag: 'post $id',
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          post.authorName,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Text(
                          post.content,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
