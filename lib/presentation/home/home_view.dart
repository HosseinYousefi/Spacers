import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/presentation/new_post/new_post_view.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yeet/yeet.dart';

import '../../application/posts/posts_bloc.dart';
import '../../domain/auth/auth_repo.dart';
import '../../domain/posts/post.dart';

class HomeView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authRepo = useProvider(authRepoProvider);
    return Scaffold(
      floatingActionButton: OpenContainer(
        closedBuilder: (context, action) => FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.post_add),
        ),
        openBuilder: (context, action) => NewPostView(),
        closedShape: CircleBorder(),
        openShape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(icon: Icon(Icons.logout), onPressed: authRepo.logout),
            ],
            leading: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => context.yeet('/settings'),
            ),
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: SvgPicture.asset('logo-white.svg'),
            ),
            floating: true,
            pinned: true,
          ),
          FeedWidget(),
        ],
      ),
    );
  }
}

const horizontalPadding = SizedBox(width: 16);

class FeedWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(postsBlocProvider.state);
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => (state.posts.isEmpty
            ? Center(
                child: SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            : PostWidget(post: state.posts[index])),
        childCount: state.posts.isEmpty ? 1 : state.posts.length,
      ),
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
