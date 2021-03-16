import 'package:flutter/material.dart';

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

class StoryWidget extends StatelessWidget {
  final Axis direction;

  StoryWidget({
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discovery',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Flex(
            direction: direction,
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

class FeedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Latest Feed',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        PostWidget(),
        PostWidget(),
        PostWidget(),
        PostWidget(),
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Container(color: Colors.grey),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_up_sharp,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_down_sharp,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
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
