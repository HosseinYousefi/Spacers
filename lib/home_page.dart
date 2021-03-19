import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/home_page_bloc.dart';
import 'package:hs_app/post_repository.dart';
import 'package:yeet/yeet.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  StoryWidget(direction: Axis.horizontal),
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

class StoryWidget extends StatefulWidget {
  final Axis direction;

  StoryWidget({
    required this.direction,
  });

  @override
  _StoryWidgetState createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () {
              context.yeet('/demo');
            },
            child: Text('Demo...')),
        Text(
          'Discovery',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
    final state = useProvider(homePageBlocProvider.state);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Feed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        if (state.isLoading)
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
    final homePageBloc = useProvider(homePageBlocProvider);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              SizedBox(height: 16),
              Row(
                children: [
                  horizontalPadding,
                  CircleAvatar(backgroundColor: Colors.grey, radius: 16),
                  horizontalPadding,
                  Text('Name'),
                  Spacer(),
                  Text('12h'),
                  horizontalPadding,
                ],
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  color: post.color,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_up_sharp,
                      color: post.likeStatus == LikeStatus.liked
                          ? Colors.purple
                          : Colors.grey,
                    ),
                    onPressed: () async {
                      homePageBloc.likePressed(post.id);
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_down_sharp,
                      color: post.likeStatus == LikeStatus.disliked
                          ? Colors.purple
                          : Colors.grey,
                    ),
                    onPressed: () async {
                      homePageBloc.dislikePressed(post.id);
                    },
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.comment,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
