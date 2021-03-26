import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/application/auth/auth_state.dart';
import 'package:hs_app/application/posts/posts_bloc.dart';
import 'package:hs_app/domain/auth/auth_repo.dart';
import 'package:hs_app/domain/db/db_repo.dart';
import 'package:hs_app/domain/posts/posts_repo.dart';
import 'package:yeet/yeet.dart';

import 'domain/posts/post.dart';

class HomePage extends HookWidget {
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
        title: Text('Harbour.Space App'),
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
                  StoryWidget(),
                  SizedBox(height: 36),
                  FeedWidget(),
                  TextField(
                    onChanged: (value) {
                      postsBloc.postContentChanged(value);
                    },
                    decoration: InputDecoration(hintText: 'Post'),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      postsBloc.postButtonPressed();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class StoryWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final dbRepo = useProvider(dbRepoProvider);
    final authState = useProvider(authBlocProvider.state);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder(
          stream: dbRepo.watchName((authState as Authenticated).user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Good Morning ${snapshot.data}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            } else {
              return Text(
                'Good Morning',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }
          },
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              StoryElement(),
              StoryElement(),
              StoryElement(),
              StoryElement(),
              StoryElement(),
              StoryElement(),
              StoryElement(),
            ],
          ),
        ),
      ],
    );
  }
}

class StoryElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 32,
          ),
          Text('Name'),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Feed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (state.posts.isEmpty)
          CircularProgressIndicator()
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
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Card(
          elevation: 5,
          child: Center(
            child: Column(
              children: [
                Text(
                  post.authorName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  post.content,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
