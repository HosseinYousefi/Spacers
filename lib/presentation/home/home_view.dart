import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yeet/yeet.dart';

import '../../application/posts/posts_bloc.dart';
import '../../domain/auth/auth_repo.dart';
import '../../domain/posts/post.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authRepo = useProvider(authRepoProvider);
    final postsBloc = useProvider(postsBlocProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              authRepo.logout();
            },
          ),
        ],
        title: Text('Spacers'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 36),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            postsBloc.postContentChanged(value);
                          },
                          decoration: InputDecoration(hintText: 'Post'),
                        ),
                      ),
                      SizedBox(height: 36),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          postsBloc.postButtonPressed();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 36),
                  FeedWidget(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

const horizontalPadding = SizedBox(width: 16);

class FeedWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(postsBlocProvider.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Feed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (state.posts.isEmpty)
          Center(child: CircularProgressIndicator())
        else
          Column(
            children: state.posts.map((e) => PostWidget(post: e)).toList(),
          ),
      ],
    );
  }
}

class PostWidget extends HookWidget {
  final Post post;

  const PostWidget({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    final postsBloc = useProvider(postsBlocProvider);
    final isLiked = useFuture(postsBloc.isLiked(post.id), initialData: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: GestureDetector(
        onTap: () => context.yeet('/post/${post.id}'),
        child: Hero(
          tag: 'post ${post.id}',
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      '@${post.authorName}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    MarkdownBody(
                      data: post.content,
                      onTapLink: (text, href, title) async {
                        if (href == null) return;
                        if (await canLaunch(href)) {
                          await launch(href);
                        }
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(isLiked.data!
                              ? Icons.favorite
                              : Icons.favorite_border),
                          onPressed: () {
                            postsBloc.likeButtonPressed(post.id);
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(post.likes.toString()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
