import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../application/posts/posts_bloc.dart';

class NewPostView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final postsBloc = useProvider(postsBlocProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: postsBloc.postButtonPressed,
        child: Icon(Icons.send),
      ),
      appBar: AppBar(
        title: Text('New Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: TextField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            expands: true,
            onChanged: (value) {
              postsBloc.postContentChanged(value);
            },
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              hintText: 'Post',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
