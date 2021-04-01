import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hs_app/application/auth/auth_bloc.dart';
import 'package:hs_app/application/auth/auth_state.dart';
import 'package:hs_app/application/posts/posts_state.dart';
import 'package:hs_app/domain/posts/post.dart';
import 'package:hs_app/domain/posts/posts_repo.dart';

class PostsBloc extends StateNotifier<PostsState> {
  final PostsRepo postsRepo;
  final Authenticated authState;

  PostsBloc(List<Post> posts, this.postsRepo, this.authState)
      : super(PostsState(posts: posts, newPostContent: ''));

  void postContentChanged(String content) {
    state = state.copyWith(newPostContent: content);
  }

  void postButtonPressed() {
    postsRepo.post(authState.user.name, authState.user.id, state.newPostContent,
        DateTime.now());
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
  final posts = ref.watch(postsStreamProvider);
  return posts.when(
    data: (data) {
      print(data);
      return PostsBloc(data, postsRepo, authState as Authenticated);
    },
    loading: () => PostsBloc([], postsRepo, authState as Authenticated),
    error: (e, __) {
      print(e);
      return PostsBloc([], postsRepo, authState as Authenticated);
    },
  );
});
