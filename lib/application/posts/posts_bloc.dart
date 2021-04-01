import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/posts/post.dart';
import '../../domain/posts/posts_repo.dart';
import '../auth/auth_bloc.dart';
import '../auth/auth_state.dart';
import 'posts_state.dart';

class PostsBloc extends StateNotifier<PostsState> {
  final PostsRepo postsRepo;
  final Authenticated authenticated;
  late final StreamSubscription<List<Post>> subscription;

  PostsBloc(this.postsRepo, this.authenticated)
      : super(PostsState(posts: [], newPostContent: '')) {
    subscription = postsRepo.watchPosts().listen((event) {
      state = state.copyWith(posts: event);
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void postContentChanged(String content) {
    state = state.copyWith(newPostContent: content);
  }

  void postButtonPressed() {
    postsRepo.post(authenticated.user.name, authenticated.user.id,
        state.newPostContent, DateTime.now());
  }

  Future<void> likeButtonPressed(String id) {
    return postsRepo.like(id);
  }

  Future<bool> isLiked(String id) {
    return postsRepo.isLiked(id);
  }
}

final postsStreamProvider = StreamProvider<List<Post>>((ref) {
  final postsRepo = ref.watch(postsRepoProvider);
  return postsRepo.watchPosts();
});

final postsBlocProvider = StateNotifierProvider<PostsBloc>((ref) {
  final authState = ref.watch(authBlocProvider.state);
  final postsRepo = ref.watch(postsRepoProvider);
  return PostsBloc(postsRepo, authState as Authenticated);
});
